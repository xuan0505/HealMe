import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testheal/screens/sign_in.dart';
import 'package:testheal/screens/welcome_page.dart';
import 'package:testheal/screens/mood.dart';

import 'package:testheal/utils/reusableWidgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // aligning logo
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: [
              Align(
                  alignment: const Alignment(-0.9, -0.9),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()));
                    },
                  )),
              Align(
                alignment: const Alignment(0, -0.7),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: reusableTextField("Username", Icons.person_outline,
                      false, _usernameTextController, TextInputType.name),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.4),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: reusableTextField("Email", Icons.email, false,
                      _emailTextController, TextInputType.emailAddress),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.1),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: reusableTextField("Password", Icons.lock, true,
                      _passwordTextController, TextInputType.visiblePassword),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.2),
                child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        FirebaseAuth.instance.currentUser?.updateDisplayName(_usernameTextController.text);
                        Mood.recordMood(user: FirebaseAuth.instance.currentUser!.uid);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      }).catchError((error, stackTrace) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                errorPop(error.message, context));
                      });
                    },
                    child: specButton("Sign Up")),
                // )
              )
            ],
          ),
        ));
  }
}
