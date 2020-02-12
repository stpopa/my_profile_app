class Category {
  final String iconAsset;
  final String title;
  String description;
  bool isEmpty;

  Category(this.iconAsset, this.title, [this.description = 'ADD NOW', this
      .isEmpty = true]);
}

enum CategoryType { user, summary, experience, skills, education, portfolio }
