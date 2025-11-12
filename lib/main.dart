import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:untitled/screens/auth/login_screen.dart';
import 'package:untitled/screens/auth/register_screen.dart';
import 'package:untitled/screens/navigator/bottomtab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'register': (context) => const RegisterScreen(),
      'login': (context) => const LoginScreen(),
      'navigator': (context) => const BottomTab(),
    },
  ));
}
