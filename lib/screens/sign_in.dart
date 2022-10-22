import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testheal/screens/navigation.dart';
import 'package:testheal/screens/welcome_page.dart';
import 'package:testheal/utils/reusableWidgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

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
                alignment: const Alignment(0, -0.8),
                child: SizedBox(
                  width: size.width * 0.4,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.3),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: reusableTextField("Email", Icons.email, false,
                      _emailTextController, TextInputType.emailAddress),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.05),
                child: SizedBox(
                  width: size.width * 0.8,
                  child: reusableTextField("Password", Icons.lock, true,
                      _passwordTextController, TextInputType.visiblePassword),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.25),
                child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Navigation()));
                      }).catchError((error, stackTrace) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                errorPop(error.message, context));
                      });
                    },
                    child: specButton("Login")),
              )
            ],
          ),
        ));
  }
}
