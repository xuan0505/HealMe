import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:testheal/screens/replies.dart';
import 'package:testheal/screens/sign_in.dart';
import 'package:testheal/utils/reusableWidgets.dart';

import '../articles/MoreArticle.dart';
import '../articles/articleview.dart';
import '../articles/articleview2.dart';
import '../podcasts/MorePodcast.dart';
import '../podcasts/podcastView.dart';
import '../podcasts/podcastView2.dart';
import '../utils/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = FirebaseAuth.instance.currentUser!.displayName.toString();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.7, -0.85),
            child: Text("Good Day,",
                style: textStyle(
                    'JosefinSans', FontWeight.w300, 30.0, Colors.white)),
          ),
          Align(
            alignment: const Alignment(-0.7, -0.75),
            child: Text(name,
                style: textStyle(
                    'JosefinSans', FontWeight.w500, 45.0, Colors.white)),
          ),
          Align(
              alignment: const Alignment(0.9, -0.55),
              child: RawMaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Replies()),
                ),
                fillColor: Colors.white,
                padding: const EdgeInsets.all(10.0),
                shape: const CircleBorder(),
                child: const Icon(Icons.notifications, size: 25.0),
              )),
          Align(
              alignment: const Alignment(0.8, -0.75),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: Container(
                  height: 50,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: HexColor.fromHex("B057D2"), width: 8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text("Logout",
                          style: textStyle('JosefinSans', FontWeight.w500, 15.0,
                              HexColor.fromHex("B057D2")))),
                ),
              )),
          Align(
            alignment: const Alignment(-0.8, -0.5),
            child: SizedBox(
              width: 115,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: textStyle(
                      'JosefinSans', FontWeight.bold, 20.0, Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const MoreArticle();
                      },
                    ),
                  );
                },
                child: const Text('Articles >'),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, 0.15),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: textStyle(
                    'JosefinSans', FontWeight.bold, 20.0, Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MorePodcast();
                    },
                  ),
                );
              },
              child: const Text('Podcasts >'),
            ),
          ),
          Transform(
              transform: Matrix4.translationValues(0.0, 200.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(10.0, 0.0, 0.0),
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
                                image: const AssetImage(
                                    'assets/home_page/Button1.png'),
                                height: size.height * 0.2,
                                width: size.width * 0.35,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Anxiety Reasons',
                                style: textStyle('JosefinSans', FontWeight.w400,
                                    15.0, Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(10.0, 45.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const podcastView();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Ink.image(
                                image: const AssetImage(
                                    'assets/home_page/Podcast1.png'),
                                height: size.height * 0.2,
                                width: size.width * 0.35,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                'Move to Your \n Happy Place',
                                style: textStyle('JosefinSans', FontWeight.w400,
                                    15.0, Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(5.0, 0.0, 0.0),
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
                                image: const AssetImage(
                                    'assets/home_page/Button2.png'),
                                height: size.height * 0.2,
                                width: size.width * 0.35,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                'Practice Gratitude',
                                style: textStyle('JosefinSans', FontWeight.w400,
                                    15.0, Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Special adjustment added
                      Transform(
                        transform: Matrix4.translationValues(0.0, 45.0, 0.0),
                        child: SizedBox(
                          height: 180,
                          width: 160,
                          child: Column(
                            children: [
                              InkWell(
                                splashColor: Colors.black26,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const podcastView2();
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Ink.image(
                                      image: const AssetImage(
                                          'assets/home_page/Podcast2.png'),
                                      height: size.height * 0.2,
                                      width: size.width * 0.35,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      'Guided Meditation',
                                      style: textStyle('JosefinSans', FontWeight.w400,
                                          15.0, Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
