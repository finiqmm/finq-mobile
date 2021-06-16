import 'package:equatable/equatable.dart';
import 'package:finq/data/tables/cache_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? avatarUrl;

  UserEntity({required this.id, this.name, this.email, this.avatarUrl});

  @override
  List<Object?> get props => [id, name, email, avatarUrl];

  @override
  String toString() {
    return 'User $id//$name//$email';
  }

  factory UserEntity.fromCacheUser(CacheUser cacheUser) {
    return CacheUser(
        id: cacheUser.id,
        name: cacheUser.name,
        email: cacheUser.email,
        avatarUrl: cacheUser.avatarUrl);
  }

  static UserEntity fromFirebaseUser(User? firebaseUser) {
    if (firebaseUser == null) {
      return UserEntity(id: '');
    }

    return UserEntity(
        id: firebaseUser.uid,
        avatarUrl: firebaseUser.photoURL,
        email: firebaseUser.email,
        name: firebaseUser.displayName);
  }
}
