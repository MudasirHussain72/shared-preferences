import 'package:flutter/material.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentScreen extends StatefulWidget {
  static const String id = 'student_screen';

  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

String userName = "";
String userEmail = "";
String userType = "";

class _StudentScreenState extends State<StudentScreen> {
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
        title: const Text("Student Screen"),
        actions: [
          InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushNamed(context, LoginScreen.id, arguments: "");
            },
            child: Icon(
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
              children: [Text("UserName"), Text(userName.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("UserEmail"), Text(userEmail.toString())],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("UserType"), Text(userType.toString())],
            ),
          ],
        ),
      ),
    );
  }
}
