import 'package:endava_profile_app/modules/domain_exp/bloc/domain_exp_events.dart';
import 'package:endava_profile_app/modules/domain_exp/bloc/domain_exp_provider.dart';
import 'package:endava_profile_app/modules/domain_exp/widgets/add_domain_input.dart';

import 'helpers/domain_strings.dart';
import 'models/DomainExperience.dart';
import 'widgets/Separator.dart';
import 'widgets/add_domain_button.dart';
import 'widgets/domain_entry.dart';
import 'widgets/domain_example.dart';
import '../../common/constants/palette.dart';

import 'package:flutter/material.dart';

class DomainExperienceBody extends StatelessWidget {
  final _descriptionStyle = TextStyle(
    fontSize: 16.0,
    color: Palette.darkGray,
  );

  @override
  Widget build(BuildContext context) {
    final bloc = DomainExpProvider.of(context);

    List<Widget> getDomainEntries({
      List<DomainExperience> initialData,
      List<DomainExperience> experiences,
    }) {

      final data = experiences != null ? experiences : initialData;

      return data.map((e) {
        return DomainEntry(
          id: e.id,
          title: e.title,
          details: e.details,
        );
      }).toList();
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () => bloc.addEvent(SubmitChanges()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: ListView(
            children: [
              Text(
                DomainExpStrings.description,
                style: _descriptionStyle,
                textAlign: TextAlign.center,
              ),
              Separator(),
              Example(
                title: DomainExpStrings.exampleTitle,
                details: DomainExpStrings.exampleDetails,
              ),
              Separator(),
              StreamBuilder<List<DomainExperience>>(
                  stream: bloc.experiences,
                  builder: (context, snapshot) {
                    List<DomainExperience> items = bloc.items;
                    return Column(
                      children: getDomainEntries(
                        initialData: items,
                        experiences: snapshot.data,
                      ),
                    );
                  }),
              StreamBuilder<bool>(
                  initialData: false,
                  stream: bloc.inputToggle,
                  builder: (context, snapshot) {
                    return snapshot.data == true
                        ? AddDomainInput()
                        : AddDomainButton();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
