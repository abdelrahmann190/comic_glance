import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  final _user = FirebaseAuth.instance.currentUser;

  User? get user => _user;

  bool get isSignedIn => _user != null;
}
