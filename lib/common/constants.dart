// Routes
enum AppScreen {
  home,
  login,
  auth,
  create_list,
  contributors,
  user_data,
  summary,
  domainExperience,
  coreSkills,
  educationAndTraining,
  professionalExperience
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
    AppScreen.user_data: '/user_data',
    AppScreen.create_list: '/create_list',
  };

  static String of(AppScreen screen) => _routes[screen];

  static String fromKey(String key) => _routes[_appScreenForKey(key)];

  static AppScreen _appScreenForKey(String key) =>
      AppScreen.values.firstWhere((element) =>
          element.toString().substring(element.toString().indexOf('.') + 1) ==
          key);
}
