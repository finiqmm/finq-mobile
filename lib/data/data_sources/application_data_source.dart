import 'package:finq/data/core/app_constants.dart';
import 'package:finq/data/tables/cache_user.dart';
import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class ApplicationDataSource {
  Future<void> finishedOnboarding();
  Future<bool> isUserPassedOnboarding();
  Future<void> cacheSignInUser(CacheUser cacheUser);
  Future<CacheUser?> getCacheUser();
  Future<void> deleteCacheUser();
}

class ApplicationDataSourceImpl extends ApplicationDataSource {
  @override
  Future<void> finishedOnboarding() async {
    final appConfigBox = await Hive.openBox(AppConstants.APP_CONFIG_BOX);
    unawaited(appConfigBox.put(AppConstants.ONBOARDING_STATUS, true));
  }

  @override
  Future<bool> isUserPassedOnboarding() async {
    final appConfigBox = await Hive.openBox(AppConstants.APP_CONFIG_BOX);
    return appConfigBox.get(AppConstants.ONBOARDING_STATUS) ?? false;
  }

  @override
  Future<void> cacheSignInUser(CacheUser cacheUser) async {
    final appConfigBox = await Hive.openBox(AppConstants.CACHED_USER_BOX);
    appConfigBox.put(AppConstants.CACHED_USER, cacheUser);
  }

  @override
  Future<CacheUser?> getCacheUser() async {
    final cachedUserBox = await Hive.openBox(AppConstants.CACHED_USER_BOX);
    return cachedUserBox.get(AppConstants.CACHED_USER) ?? null;
  }

  @override
  Future<void> deleteCacheUser() async {
    final cachedUserBox = await Hive.openBox(AppConstants.CACHED_USER_BOX);
    await cachedUserBox.delete(AppConstants.CACHED_USER);
  }
}
