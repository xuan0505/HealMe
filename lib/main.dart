import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testheal/screens/navigation.dart';
import 'package:testheal/screens/welcome_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HealMe());
}

class HealMe extends StatelessWidget {
  const HealMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
