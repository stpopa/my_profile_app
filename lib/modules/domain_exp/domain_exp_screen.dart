import 'package:endava_profile_app/models/item.dart';

import '../../common/constants.dart';
import '../../common/constants/dimens.dart';
import '../../common/constants/palette.dart';
import 'helpers/domain_strings.dart';
import 'bloc/domain_exp_events.dart';
import 'bloc/domain_exp_provider.dart';
import 'domain_exp_body.dart';

import 'package:flutter/material.dart';

import 'models/DomainExperience.dart';

class DomainExperienceScreen extends StatefulWidget {
  final Item item;
  DomainExperienceScreen({this.item});

  @override
  _DomainExperienceScreenState createState() => _DomainExperienceScreenState();
}

class _DomainExperienceScreenState extends State<DomainExperienceScreen> {
  final _titleStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Palette.black,
  );

  @override
  Widget build(BuildContext context) {

    final bloc = DomainExpProvider.of(context);
    bloc.prepareInitialData(widget.item); // <-- this might be the worst thing I've done in my career

    return StreamBuilder<bool>(
      initialData: false,
      stream: bloc.loadingSpinnerToggle,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: snapshot.data == true ? null : AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              DomainExpStrings.title,
              style: _titleStyle,
            ),
            leading: IconButton(
              icon: Image.asset(
                'assets/images/arrow-back.png',
                width: Dimens.sectionArrowWidth,
              ),
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                AppRoute.of(AppScreen.home),
              ),
            ),
            actions: [
              StreamBuilder<bool>(
                  initialData: false,
                  stream: bloc.saveToggle,
                  builder: (context, snapshot) {
                    return IconButton(
                      icon: Icon(Icons.save),
                      color: Palette.harleyDavidsonOrange,
                      onPressed: snapshot.data == true
                          ? () => bloc.addEvent(SaveExperiences())
                          : null,
                    );
                  }),
            ],
          ),
          body: snapshot.data == true ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
              strokeWidth: 6,
            ),
          ) : DomainExperienceBody(),
        );
      }
    );
  }
}
