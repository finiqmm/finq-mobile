import 'package:finq/data/core/app_constants.dart';
import 'package:finq/data/tables/cache_user.dart';
import 'package:finq/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';

abstract class ApplicationDataSource {
  Future<void> finishedOnboarding();
  Future<bool> isUserPassedOnboarding();
  Future<void> cacheSignInUser(CacheUser cacheUser);
  Future<CacheUser?> getCacheUser(String id);
  Future<void> deleteCacheUser(String userId);
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
    appConfigBox.put(cacheUser.id, cacheUser);
  }

  @override
  Future<CacheUser?> getCacheUser(String id) async {
    final cachedUserBox = await Hive.openBox(AppConstants.CACHED_USER_BOX);
    return cachedUserBox.get(id) ?? null;
  }

  @override
  Future<void> deleteCacheUser(String userId) async {
    final cachedUserBox = await Hive.openBox(AppConstants.CACHED_USER_BOX);
    await cachedUserBox.delete(userId);
  }
}
