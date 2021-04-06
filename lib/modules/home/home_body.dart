import 'package:endava_profile_app/common/components/flutter_team.dart';
import 'package:endava_profile_app/common/components/profile_app_bar.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/modules/core_skills/core_skills_screen.dart';
import 'package:endava_profile_app/modules/education/education_training_screen.dart';
import 'package:endava_profile_app/modules/domain_exp/bloc/domain_exp_provider.dart';
import 'package:endava_profile_app/modules/domain_exp/domain_exp_screen.dart';
import 'package:endava_profile_app/modules/home/components/progress_bar.dart';
import 'package:endava_profile_app/modules/home/components/view_list_button.dart';
import 'package:endava_profile_app/modules/home/models/section_list_item.dart';
import 'package:endava_profile_app/modules/summary/summary_screen.dart';
import 'package:endava_profile_app/modules/user_data/user_data_screen.dart';
import 'package:endava_profile_app/modules/professional_experience/professional_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endava_profile_app/common/constants.dart';

import 'bloc/bloc.dart';
import 'components/section_card.dart';
import 'home_mapper.dart';
import 'models/placeholder_item.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeBloc _bloc;

  List<SectionListItem> contentItems = [];
  List<Item> items = [];

  final List<SectionListItem> placeholders = [
    PlaceholderItem(
      key: 'user',
      title: 'Name and role',
      icon: 'assets/images/user.png',
    ),
    PlaceholderItem(
      key: 'summary',
      title: 'Summary',
      icon: 'assets/images/summary.png',
    ),
    PlaceholderItem(
      key: 'experiences',
      title: 'Domain experience',
      icon: 'assets/images/experience.png',
    ),
    PlaceholderItem(
      key: 'skills',
      title: 'Core skills',
      icon: 'assets/images/skills.png',
    ),
    PlaceholderItem(
      key: 'education',
      title: 'Education and training',
      icon: 'assets/images/education.png',
    ),
    PlaceholderItem(
      key: 'portfolio',
      title: 'Professional experience',
      icon: 'assets/images/portfolio.png',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(ScreenLoaded());
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeSuccessResponse) {
        items = state.items;
        contentItems = HomeMapper.map(response: state);

        final sections = _getSections();
        final myListsButton = Container(
          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: ViewListButton(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoute.of(AppScreen.yourLists));
            },
          ),
        );

        return CustomScrollView(
          slivers: [
            ProfileAppBar(
                bgColor: Theme.of(context).scaffoldBackgroundColor,
                trailingActions: [
                  IconButton(
                    icon: Icon(Icons.power_settings_new),
                    color: Palette.cinnabar,
                    onPressed: () {
                      _bloc.add(Logout());
                    },
                  )
                ]),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(0, Dimens.spacingLarge, 0, 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProgressBar(
                        percent: contentItems.length / placeholders.length,
                      ),
                      state.currentUser.isModerator
                          ? myListsButton
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SectionCard(
                    section: sections[index],
                    onTap: _onSectionCardTap,
                  );
                },
                childCount: sections.length,
                semanticIndexOffset: 2,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: FlutterTeam(
                onTap: () {
                  Navigator.of(context).pushNamed('/contributors');
                },
              ),
            ),
          ],
        );
      } else if (state is ReplaceHomeRoute) {
        Future.delayed(Duration(milliseconds: 10), () {
          Navigator.of(context)
              .pushReplacementNamed(AppRoute.of(state.replaceRoute));
        });

        return SizedBox();
      } else {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
            strokeWidth: 6,
          ),
        );
      }
    });
  }

  List<SectionListItem> _getSections() => placeholders
      .map(
        (placeholder) => contentItems.firstWhere(
          (item) => item.key == placeholder.key,
          orElse: () => placeholder,
        ),
      ).toList();

  _onSectionCardTap(String key) {
    print(key);
    switch (key) {
      case 'experiences':
        final domainExpItem = items.firstWhere(
            (element) => element.key == "experiences",
            orElse: () => Item(key: 'experiences', value: []));
        _navigateToCategory(
          DomainExpProvider(
            child: DomainExperienceScreen(item: domainExpItem),
          ),
        );
        break;
      case 'skills':
        _navigateToCategory(CoreSkillsScreen());
        break;
      case 'summary':
        _navigateToCategory(SummaryScreen());
        break;
      case 'education':
        _navigateToCategory(EducationTrainingScreen());
        break;
      case 'user':
        _navigateTo(UserDataScreen());
        break;
      case 'portfolio':
        _navigateTo(ProfessionalExperienceScreen());
        break;
    }
  }

  _navigateToCategory(Widget widget) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        )
        .then((item) => {
              if (item != null) {_bloc.add(Reload(item))}
            });
  }

  _navigateTo(Widget widget) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) => widget,
      ),
    );

    if (result != null) _bloc.add(ScreenLoaded());
  }
}
