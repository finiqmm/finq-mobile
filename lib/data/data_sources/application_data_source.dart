import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class ApplicationDataSource {
  Future<void> finishedOnboarding();
  Future<bool> isOnboardingFinish();
}

class ApplicationDataSourceImpl extends ApplicationDataSource {
  @override
  Future<void> finishedOnboarding() async {
    final appConfigBox = await Hive.openBox('appConfigBox');
    unawaited(appConfigBox.put('onboardingStatus', true));
  }

  @override
  Future<bool> isOnboardingFinish() async {
    final appConfigBox = await Hive.openBox('appConfigBox');
    return appConfigBox.get('onboardingStatus') ?? false;
  }
}
