import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_pref/screens/student.dart';
import 'package:shared_pref/screens/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup_screen';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String dropdownValue = 'Student';
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("SignUp Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: "Name",
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
                  Icons.supervised_user_circle_sharp,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
            SizedBox(
              width: double.infinity,
              child: DropdownButton<String>(
                isExpanded: true,
                alignment: const AlignmentDirectional(1.0, 0.0),
                value: dropdownValue,
                // icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 1,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Student',
                  'Teacher',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString(
                    "userName", userNameController.text.trim());
                await prefs.setString("email", emailController.text.trim());
                await prefs.setString("userType", dropdownValue);
                await prefs.setBool("isLogin", true);
                var userType = prefs.getString("userType");
                if (userType == 'Student') {
                  Navigator.pushReplacementNamed(context, StudentScreen.id,
                      arguments: "");
                } else if (userType == 'Teacher') {
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
                  "SignUp",
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
                  const TextSpan(text: 'I already have an account '),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, LoginScreen.id,
                              arguments: "");
                        },
                      text: 'Login',
                      style: const TextStyle(color: Colors.deepPurple))
                ])),
          ],
        ),
      ),
    );
  }
}
