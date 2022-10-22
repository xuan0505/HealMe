import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testheal/utils/reusableWidgets.dart';
import 'package:testheal/screens/galaxy.dart';

class ShootStar extends StatefulWidget {
  const ShootStar({Key? key}) : super(key: key);

  @override
  State<ShootStar> createState() => _ShootStarState();
}

class _ShootStarState extends State<ShootStar> {
  final TextEditingController _msgTextController = TextEditingController();
  final ref = FirebaseFirestore.instance.collection('messages');
  String id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/Picture4.png"),
            fit: BoxFit.fill,
          )),
          child: Stack(children: [
            Align(
              alignment: const Alignment(0, 0.75),
              child: GestureDetector(
                  onTap: () {
                    shootStar(user: id, content: _msgTextController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Galaxy()));
                  },
                  child: starButton("Shoot the star!")),
            ),
            bigText(_msgTextController, size),
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
                            builder: (context) => const Galaxy()));
                  },
                )),
          ]),
        ));
  }

  Future shootStar({required String user, content}) async {
    // write to database
    //creating reference
    final ref = FirebaseFirestore.instance.collection('messages').doc();

    final message =
        Message(msgID: ref.id, user: user, content: content, replies: []);

    final json = message.toJson();
    await ref.set(json);
  }
}

class Message {
  String msgID;
  String user;
  final String content;
  List<dynamic> replies;

  Message({
    required this.msgID,
    required this.user,
    required this.content,
    required this.replies,
  });

  Map<String, dynamic> toJson() => {
        'msgID': msgID,
        'user': user,
        'content': content,
        'replies': replies,
      };

  static Message fromJson(Map<String, dynamic> json) => Message(
        msgID: json['msgID'],
        user: json['user'],
        content: json['content'],
        replies: json['replies'],
      );
}
