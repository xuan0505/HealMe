import 'package:testheal/articles/articleview.dart';
import 'package:testheal/articles/articleview2.dart';
import 'package:testheal/articles/articleview3.dart';
import 'package:testheal/articles/articleview4.dart';
import 'package:testheal/articles/articleview5.dart';
import 'package:testheal/articles/articleview6.dart';
import 'package:flutter/material.dart';

import '../utils/reusableWidgets.dart';

class MoreArticle extends StatelessWidget {
  const MoreArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Stack(children: [
          Align(
            alignment: const Alignment(0, -0.9),
            child: Text(
              "Articles",
              style:
                  textStyle('JosefinSans', FontWeight.bold, 40.0, Colors.white),
            ),
          ),
          backButton(context),
          Transform(
              transform: Matrix4.translationValues(30.0, 100.0, 0.0),
              child: InkWell(
                splashColor: Colors.black26,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Article();
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Ink.image(
                      image: const AssetImage('assets/home_page/Button1.png'),
                      height: size.height * 0.2,
                      width: size.width * 0.35,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Anxiety Reasons',
                      style: textStyle(
                          'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              )),
          Transform(
            transform: Matrix4.translationValues(30.0, 290.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Article3();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Button3.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'How to be Happy',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(30.0, 480.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Article5();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Button5.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Loneliness',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(210.0, 100.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Article2();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Button2.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Practice Gratitude',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(210.0, 290.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Article4();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Button4.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Dealing with Anger',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(210.0, 480.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Article6();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Button6.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Courageous Life',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
