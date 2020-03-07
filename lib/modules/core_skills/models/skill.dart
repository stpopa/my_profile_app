class Skill {
  final String title;
  final String icon;
  final int level;

  const Skill({
    this.title,
    this.icon,
    this.level,
  });
}

const List<Skill> skills = const <Skill>[
  const Skill(
    title: 'Java',
    icon: 'assets/images/java-logo.png',
    level: 1,
  ),
  const Skill(
    title: 'Kotlin',
    icon: 'assets/images/kotlin-logo.png',
    level: 0,
  ),
  const Skill(
    title: 'Dart',
    icon: 'assets/images/swift-logo.png',
    level: 2,
  ),
];
