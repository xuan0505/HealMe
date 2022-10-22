import 'package:flutter/material.dart';
import 'package:testheal/screens/home.dart';
import 'package:testheal/screens/navigation.dart';
import 'package:testheal/utils/reusableWidgets.dart';
import 'package:testheal/screens/shoot_star.dart';
import 'package:testheal/screens/catch_star.dart';

class Galaxy extends StatefulWidget {
  const Galaxy({Key? key}) : super(key: key);

  @override
  State<Galaxy> createState() => _GalaxyState();
}

class _GalaxyState extends State<Galaxy> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      // aligning logo
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/Picture3.png"),
        fit: BoxFit.fill,
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
                          builder: (context) => const Navigation()));
                },
              )),
          Align(
              alignment: const Alignment(0.5, -0.6),
              child: SizedBox(
                width: size.width * 0.65,
                child: Image.asset("assets/images/text_bubble.png"),
              )),
          Align(
              alignment: const Alignment(0.27, -0.5),
              child: Text("Tell Me Anything",
                  style: textStyle(
                      'JosefinSans', FontWeight.bold, 18.0, Colors.black))),
          Align(
            alignment: const Alignment(-0.8, 0.75),
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShootStar())),
                child: starButton("Shoot a star")),
          ),
          Align(
              alignment: const Alignment(0.8, 0.75),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CatchStar())),
                child: starButton("Catch a star"),
              ))
        ],
      ),
    ));
  }
}
