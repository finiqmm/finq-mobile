import 'package:equatable/equatable.dart';
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

  static UserEntity fromUser(User? firebaseUser) {
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
