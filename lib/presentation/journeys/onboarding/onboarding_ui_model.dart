class Onboarding {
  final String title;
  final String label;
  final String imagePath;

  Onboarding(
      {required this.title, required this.label, required this.imagePath});
}

final onboardingItemList = [
  Onboarding(
      title: 'Connect people\naround the world',
      label:
          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
      imagePath: 'assets/images/onboarding_1.png'),
  Onboarding(
      title: 'Live your life smarter\nwith us!',
      label:
          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
      imagePath: 'assets/images/onboarding_2.png'),
  Onboarding(
      title: 'Get a new experience\nof imagination',
      label:
          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
      imagePath: 'assets/images/onboarding_1.png'),
];
