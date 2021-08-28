import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthDataSource {
  Future<void> loginWithGoogle();
  Future<void> logoutUser();
  Stream<User?> getAuthStated();
  Future<Option<User>> getCurrentUser();
}

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthDataSourceImpl(this._firebaseAuth, this._googleSignIn);

  @override
  Stream<User?> getAuthStated() {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<Option<User>> getCurrentUser() async =>
      optionOf(_firebaseAuth.currentUser);

  @override
  Future<void> loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    if (googleAuth?.idToken == null) throw Exception('Login Failed');

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> logoutUser() async {
    await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }
}
