import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testheal/utils/reusableWidgets.dart';
import 'package:testheal/screens/moodlog.dart';
import 'package:intl/intl.dart';

class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  State<Mood> createState() => _MoodState();

  static Future recordMood({required String user}) async {
    final ref = FirebaseFirestore.instance.collection("mood").doc(user);
    final mood = MoodDetail(user: user);
    final json = mood.toJson();

    await ref.set(json);
  }
}

class _MoodState extends State<Mood> {
  int _selected = 0;
  String id = FirebaseAuth.instance.currentUser!.uid;
  DateTime current = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd H:mm');
  late String formatted = formatter.format(current);
  String moodDetail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Align(alignment: const Alignment(0, -0.6), child: title("How are you feeling?", 30.0)),
          Align(
            alignment: const Alignment(-0.8, -0.2),
            child: icon(0, "🙂", "Happy"),
          ),
          Align(
            alignment: const Alignment(0, -0.2),
            child: icon(1, "😐", "Neutral"),
          ),
          Align(
            alignment: const Alignment(0.8, -0.2),
            child: icon(2, "😟", "Sad"),
          ),
          GestureDetector(
              onTap: () {
                if (_selected == 0) {
                  moodDetail = "🙂 Happy $formatted";
                } else if (_selected == 1) {
                  moodDetail = "😐 Neutral $formatted";
                } else if (_selected == 2) {
                  moodDetail = "😟 Sad $formatted";
                }
                setMood(moodDetail);
                // show succesful message
              },
              child: Align(
                alignment: const Alignment(0, 0.2),
                child: specButton("Record"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MoodLog()));
              },
              child: Align(
                alignment: const Alignment(0, 0.4),
                child: specButton("Mood Log"),
              ))
        ],
      ),
    ));
  }

  Widget icon(int index, String text, label) {
    return GestureDetector(
        onTap: () => setState(() {
              _selected = index;
            }),
        child: DecoratedBox(
            decoration: BoxDecoration(
              border:
                  _selected == index ? Border.all(color: Colors.white) : null,
            ),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                children: [
                  Text(text,
                      style: textStyle(
                          'JosefinSans', FontWeight.w500, 60.0, Colors.black)),
                  Text(label,
                      style: textStyle(
                          'JosefinSans', FontWeight.w500, 20.0, Colors.white))
                ],
              ),
            )));
  }

  void setMood(String mood) {
    final doc = FirebaseFirestore.instance.collection('mood').doc(id);
    doc.update({
      'moods': FieldValue.arrayUnion([mood])
    });
  }


}

class MoodDetail {
  String user;
  List<dynamic> moods = [];

  MoodDetail({
    required this.user,
  });

  Map<String, dynamic> toJson() => {
        'user': user,
      };

  static MoodDetail fromJson(Map<String, dynamic> json) => MoodDetail(
        user: json['user'],
      );



}
