enum HomeCategory {
  user,
  summary,
  experience,
  skills,
  education,
  portfolio,
}

class HomeCategoryData {
  static Map<HomeCategory, String> _assets = {
    HomeCategory.user: "assets/images/user.png",
    HomeCategory.summary: "assets/images/summary.png",
    HomeCategory.experience: "assets/images/experience.png",
    HomeCategory.skills: "assets/images/skills.png",
    HomeCategory.education: "assets/images/education.png",
    HomeCategory.portfolio: "assets/images/portfolio.png",
  };

  static Map<HomeCategory, String> _titles = {
    HomeCategory.user: "User",
    HomeCategory.summary: "Summary",
    HomeCategory.experience: "Domain experience",
    HomeCategory.skills: "Core skills",
    HomeCategory.education: "Education and training",
    HomeCategory.portfolio: "Profesional experience",
  };

  static Map<HomeCategory, String> _keys = {
    HomeCategory.user: "user",
    HomeCategory.summary: "summary",
    HomeCategory.experience: "experience",
    HomeCategory.skills: "skills",
    HomeCategory.education: "education",
    HomeCategory.portfolio: "portfolio",
  };

  static HomeCategory categoryFor(String key) {
    return _keys.keys.firstWhere((k) => _keys[k] == key, orElse: () => null);
  }

  static String titleFor(HomeCategory category) {
    return _titles[category];
  }

  static String keyFor(HomeCategory category) {
    return _keys[category];
  }

  static String assetFor(HomeCategory category) {
    return _assets[category];
  }
}
