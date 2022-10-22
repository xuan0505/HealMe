import 'package:testheal/podcasts/podcastView.dart';
import 'package:testheal/podcasts/podcastView2.dart';
import 'package:testheal/podcasts/podcastView3.dart';
import 'package:testheal/podcasts/podcastView4.dart';
import 'package:testheal/podcasts/podcastView5.dart';
import 'package:testheal/podcasts/podcastView6.dart';
import 'package:flutter/material.dart';

import '../utils/reusableWidgets.dart';

class MorePodcast extends StatelessWidget {
  const MorePodcast({Key? key}) : super(key: key);

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
              "Podcasts",
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
                      return const podcastView();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Podcast1.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Move to Your \nHappy Place',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(30.0, 290.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const podcastView3();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Podcast3.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Perspectives',
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
                      return const podcastView5();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Podcast5.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Mentally Yours',
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
                      return const podcastView2();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Podcast2.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Guided Meditation',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(190.0, 290.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const podcastView4();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Podcast4.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'What\'s Gonna Happen?',
                    style: textStyle(
                        'JosefinSans', FontWeight.w400, 15.0, Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(210.0, 490.0, 0.0),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const podcastView6();
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  Ink.image(
                    image: const AssetImage('assets/home_page/Podcast6.png'),
                    height: size.height * 0.2,
                    width: size.width * 0.35,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Hilarious World',
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
