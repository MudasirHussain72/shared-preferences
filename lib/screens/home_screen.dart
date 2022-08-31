import 'package:flutter/material.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String userName = "";
String userEmail = "";
String userType = "";

class _HomeScreenState extends State<HomeScreen> {
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
      userEmail = prefs.getString('email') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text("Home Screen"),
        actions: [
          InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Icon(
              Icons.logout_outlined,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(child: Text(userEmail.toString())),
    );
  }
}
