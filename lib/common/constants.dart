// Routes
enum AppScreen {
  home,
  login,
  auth,
  createList,
  contributors,
  userData,
  summary,
  domainExperience,
  coreSkills,
  educationAndTraining,
  professionalExperience,
  yourLists
}

class AppRoute {
  static Map<AppScreen, String> _routes = {
    AppScreen.auth: '/',
    AppScreen.home: '/home',
    AppScreen.login: '/login',
    AppScreen.contributors: '/contributors',
    AppScreen.summary: '/summary',
    AppScreen.domainExperience: '/domainExperience',
    AppScreen.coreSkills: '/coreSkills',
    AppScreen.educationAndTraining: '/educationAndTraining',
    AppScreen.professionalExperience: '/professionalExperience',
    AppScreen.userData: '/userData',
    AppScreen.createList: '/createList',
    AppScreen.yourLists: '/yourLists',
  };

  static String of(AppScreen screen) => _routes[screen];

  static String fromKey(String key) => _routes[_appScreenForKey(key)];

  static AppScreen _appScreenForKey(String key) =>
      AppScreen.values.firstWhere((element) =>
          element.toString().substring(element.toString().indexOf('.') + 1) ==
          key);
}
