import 'package:firebase_auth/firebase_auth.dart';

class AppAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> changeUserPassword(
      {required String oldPassword, required String newPassword}) async {
    final user = _auth.currentUser;
    if (user != null) {
      final email = user.email;
      final credential =
          EmailAuthProvider.credential(email: email!, password: oldPassword);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}
