import 'package:flutter/material.dart';
import 'package:shared_pref/screens/home_screen.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_pref/screens/signup.dart';
import 'package:shared_pref/screens/splash_screen.dart';
import 'package:shared_pref/screens/student.dart';
import 'package:shared_pref/screens/teacher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        StudentScreen.id: (context) => const StudentScreen(),
        TeacherScreen.id: (context) => const TeacherScreen(),
      },
    );
  }
}
