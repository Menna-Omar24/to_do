import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'core/app/to_do.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (FirebaseAuth.instance.currentUser == null) {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print("Signed in anonymously");
    } catch (e) {
      print("Error signing in anonymously: $e");
    }
  }

  runApp(ToDo());

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in: ${user.uid}');
    }
  });
}
