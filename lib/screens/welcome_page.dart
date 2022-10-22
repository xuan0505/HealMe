import 'package:flutter/material.dart';
import 'package:testheal/utils/color.dart';
import 'package:testheal/screens/sign_in.dart';
import 'package:testheal/screens/sign_up.dart';
import 'package:testheal/utils/reusableWidgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // For original size
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // aligning logo
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Align(
            alignment: const Alignment(0, -0.6),
            child: SizedBox(
              width: size.width * 0.75,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Align(
              alignment: const Alignment(0, 0.05),
              child: Text("Welcome",
                  style: textStyle('JosefinSans', FontWeight.w500, 50.0,
                      Colors.white))),
          Align(
            alignment: const Alignment(0, 0.3),
            child: GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    ),
                child: specButton("Login")),
          ),
          Align(
              alignment: const Alignment(0, 0.45),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account? ",
                        style: textStyle('JosefinSans', FontWeight.w200, 14.0,
                            Colors.white)),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      ),
                      child: (Text("Sign Up",
                          style: textStyle('JosefinSans', FontWeight.bold, 14.0,
                              Colors.white))),
                    )
                  ])),
        ]),
      ),
    );
  }
}
