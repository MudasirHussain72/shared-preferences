import 'package:flutter/material.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  static const String id = 'teacher_screen';

  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

String userName = "";
String userEmail = "";
String userType = "";

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logindata();
  }

  logindata() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString('userName') ?? "";
      userEmail = prefs.getString('email') ?? "";
      userType = prefs.getString('userType') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Teacher Screen"),
        actions: [
          InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushNamed(context, LoginScreen.id, arguments: "");
            },
            child: const Icon(
              Icons.logout_outlined,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("UserName"), Text(userName.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("UserEmail"), Text(userEmail.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("UserType"), Text(userType.toString())],
            ),
          ],
        ),
      ),
    );
  }
}
