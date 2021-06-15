import 'package:finq/domain/entities/user_entity.dart';
import 'package:hive/hive.dart';
part 'cache_user.g.dart';
@HiveType(typeId: 0)
class CacheUser extends UserEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? avatarUrl;

  CacheUser({required this.id, this.name, this.email, this.avatarUrl})
      : super(id: id, avatarUrl: avatarUrl, email: email, name: name);

  factory CacheUser.fromMovieEntity(UserEntity userEntity) {
    return CacheUser(
        id: userEntity.id,
        name: userEntity.name,
        email: userEntity.email,
        avatarUrl: userEntity.avatarUrl);
  }
}
