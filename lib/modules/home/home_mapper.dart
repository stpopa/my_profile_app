import 'package:endava_profile_app/modules/core_skills/models/skill_category.dart';

import 'bloc/bloc.dart';
import 'models/content_item.dart';
import 'models/home_category.dart';
import 'models/section_list_item.dart';

class HomeMapper {
  static List<SectionListItem> map({HomeSuccessResponse response}) {
    List<SectionListItem> contentItems = [
      UserItem(
        key: HomeCategoryData.keyFor(HomeCategory.user),
        user: response.currentUser,
      ),
    ];

    response.items.forEach((item) {
      final category = HomeCategoryData.categoryFor(item.key);
      if (null != category) {
        switch (category) {
          case HomeCategory.summary:
          // Map to created models...
            String value = item.value['value'];
            contentItems.add(
              ContentItem(
                key: HomeCategoryData.keyFor(category),
                value: value,
                icon: HomeCategoryData.assetFor(category),
                title: HomeCategoryData.titleFor(category),
              ),
            );
            break;

        case HomeCategory.experience:
          final experiences = item.value.length > 0
              ? List.from(item.value)
                  .map((e) => e['title'])
                  .reduce((value, element) => value + ',' + element)
              : null;

          if (experiences != null) {
            contentItems.add(
              DomainExperienceItem(
                key: HomeCategoryData.keyFor(category),
                value: experiences,
                icon: HomeCategoryData.assetFor(category),
                title: HomeCategoryData.titleFor(category),
              ),
            );
          }
          break;

        case HomeCategory.skills:
          var skills = List.from(item.value)
              .map((category) => SkillCategory.fromJson(category))
              .fold<List<String>>(
            [],
            (result, category) {
              return result
                ..addAll(
                  category.skills.map((skill) => skill.title),
                );
            },
          ).toList();

          contentItems.add(
            SkillsItem(
              key: HomeCategoryData.keyFor(category),
              skills: skills,
              icon: HomeCategoryData.assetFor(category),
              title: HomeCategoryData.titleFor(category),
            ),
          );
          break;

          case HomeCategory.education:
          // Map to created models...
            String value = item.value['education'];
            contentItems.add(
              ContentItem(
                key: HomeCategoryData.keyFor(category),
                value: value,
                icon: HomeCategoryData.assetFor(category),
                title: HomeCategoryData.titleFor(category),
              ),
            );
            break;

          case HomeCategory.portfolio:
          // Map to created models...
            String value = item.value['portfolio'];
            contentItems.add(
              PortfolioItem(
                key: HomeCategoryData.keyFor(category),
                value: value,
                icon: HomeCategoryData.assetFor(category),
                title: HomeCategoryData.titleFor(category),
              ),
            );
            break;

          default:
            break;
        }
      }
    });

    return contentItems;
  }
}
