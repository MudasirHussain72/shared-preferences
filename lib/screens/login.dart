import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref/screens/signup.dart';
import 'package:shared_pref/screens/student.dart';
import 'package:shared_pref/screens/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

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
        automaticallyImplyLeading: false,
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
              onTap: () async {
                // Obtain shared preferences.
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLogin', true);
                await prefs.setString("email", emailController.text.trim());
                await prefs.setString("password", passController.text.trim());
                var userType = prefs.getString("userType");
                if (await userType == 'Student') {
                  Navigator.pushReplacementNamed(context, StudentScreen.id,
                      arguments: "");
                } else if (await userType == 'Teacher') {
                  Navigator.pushReplacementNamed(context, TeacherScreen.id,
                      arguments: "");
                }
              },
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
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(text: 'Dont have an account? '),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignupScreen.id,
                              arguments: "");
                        },
                      text: 'Register',
                      style: const TextStyle(color: Colors.deepPurple))
                ])),
          ],
        ),
      ),
    );
  }
}
