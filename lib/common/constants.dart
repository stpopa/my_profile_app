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
}
