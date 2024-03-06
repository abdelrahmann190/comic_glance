import 'package:firebase_auth/firebase_auth.dart';

class AppAuthServices {
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

void getUserData() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // User is signed in
    String uid = user.uid; // Unique identifier for the user
    String? email = user.email;
    String? displayName = user.displayName;
    String? photoURL = user.photoURL;

    // Use the user data as needed
    print('UID: $uid');
    print('Email: $email');
    print('Display Name: $displayName');
    print('Photo URL: $photoURL');
  } else {
    // No user is signed in
    print('No user is signed in.');
  }
}
