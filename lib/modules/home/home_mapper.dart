import 'models/content_item.dart';
import 'models/section_list_item.dart';
import 'models/home_category.dart';
import 'bloc/bloc.dart';

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
      switch(category) {
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

        case HomeCategory.skills:
        // Map to created models...
          List<dynamic> skills = item.value['skills'];
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


    });

    return contentItems;
  }
}
