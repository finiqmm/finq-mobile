import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class ApplicationDataSource {
  Future<void> finishedOnboarding();
  Future<bool> isUserPassedOnboarding();
}

class ApplicationDataSourceImpl extends ApplicationDataSource {
  @override
  Future<void> finishedOnboarding() async {
    final appConfigBox = await Hive.openBox('appConfigBox');
    unawaited(appConfigBox.put('onboardingStatus', true));
  }

  @override
  Future<bool> isUserPassedOnboarding() async {
    final appConfigBox = await Hive.openBox('appConfigBox');
    return appConfigBox.get('onboardingStatus') ?? false;
  }
}
