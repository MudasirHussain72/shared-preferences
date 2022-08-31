import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_pref/screens/student.dart';
import 'package:shared_pref/screens/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isLogin();
  }

  void isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    var userType = prefs.getString('userType');
    if (isLogin) {
      if (userType == "Student") {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      } else if (userType == "Teacher") {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const TeacherScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: const Center(
        child: Text(
          "SHARED PREFRENCE",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
