import 'category.dart';

class Profile {
  Map<CategoryType, Category> categories = {
    CategoryType.user:
        Category('assets/images/profile-user.png', 'Name and role'),
    CategoryType.summary:
        Category('assets/images/profile-summary.png', 'Summary'),
    CategoryType.experience:
        Category('assets/images/profile-experience.png', 'Domain experience'),
    CategoryType.skills:
        Category('assets/images/profile-skills.png', 'Core skills'),
    CategoryType.education:
        Category('assets/images/profile-education.png', 'Education and '
            'training'),
    CategoryType.portfolio:
        Category('assets/images/profile-portfolio.png', 'Professional '
            'experience'),
  };

}
