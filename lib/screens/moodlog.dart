import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/color.dart';
import '../utils/reusableWidgets.dart';

class MoodLog extends StatefulWidget {
  const MoodLog({Key? key}) : super(key: key);

  @override
  State<MoodLog> createState() => _MoodLogState();
}

class _MoodLogState extends State<MoodLog> {
  List<dynamic> mph = [];

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
              Align(
                alignment: const Alignment(0, -0.7),
                child: title("Mood Log", 40.0),
              ),
              backButton(context),
              pickUser(),
            ],
          )),
    );
  }

  Widget pickUser() {
    return Align(
        alignment: const Alignment(0, 0.9),
        child: SizedBox(
            width: 310,
            height: 500,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: RawScrollbar(
                    thumbVisibility: true,
                    thumbColor: HexColor.fromHex("313131"),
                    radius: const Radius.circular(10.0),
                    child: buildMood()))));
  }

  ListView buildMood() {
    FirebaseFirestore.instance
        .collection("mood")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        mph = value.data()!["moods"];
      });
    });
    return ListView.builder(
        itemCount: mph.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
                color: Colors.white.withOpacity(0.7),
              ),
              child: ListTile(
                title: Text(
                  mph[index],
                  style: textStyle(
                      'JosefinSans', FontWeight.w500, 15.0, Colors.black),
                ),
              ));
        });
  }
}
