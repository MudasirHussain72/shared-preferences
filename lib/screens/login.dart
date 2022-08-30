import 'package:flutter/material.dart';
import 'package:shared_pref/screens/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.deepPurple,
                ),
                prefixIcon: Icon(
                  Icons.alternate_email_outlined,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: "Password",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.deepPurple,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
