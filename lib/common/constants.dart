// Routes
enum AppScreen {
  home,
  login,
  contributors,
  summary,
  domainExperience,
  coreSkills,
  educationAndTraining,
  professionalExperience
}

class AppRoute {
  static Map<AppScreen, String> _routes = {
    AppScreen.home: '/',
    AppScreen.login: '/login',
    AppScreen.contributors: '/contributors',
    AppScreen.summary: '/summary',
    AppScreen.domainExperience: '/domainExperience',
    AppScreen.coreSkills: '/coreSkills',
    AppScreen.educationAndTraining: '/educationAndTraining',
    AppScreen.professionalExperience: '/professionalExperience'
  };

  static String of(AppScreen screen) => _routes[screen];

  static String fromKey(String key) => _routes[_appScreenForKey(key)];

  static AppScreen _appScreenForKey(String key) =>
      AppScreen.values.firstWhere((element) =>
          element.toString().substring(element.toString().indexOf('.') + 1) ==
          key);
}
