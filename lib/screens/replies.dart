import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testheal/screens/catch_star.dart';
import 'package:testheal/screens/shoot_star.dart';
import 'package:testheal/utils/color.dart';
import 'package:testheal/utils/reusableWidgets.dart';

class Replies extends StatefulWidget {
  const Replies({Key? key}) : super(key: key);

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  var toRemove = [];

  @override
  Widget build(BuildContext context) {
    String name = FirebaseAuth.instance.currentUser!.displayName.toString();

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Align(
            alignment: const Alignment(-0.75, -0.75),
            child: Text(name,
                style: textStyle(
                    'JosefinSans', FontWeight.w500, 45.0, Colors.white)),
          ),
          pickMessage(readMessage(), context),
          backButton(context),
        ]));
  }

  StreamBuilder<List<Message>> pickMessage(
      Stream<List<Message>> list, BuildContext context) {

    return StreamBuilder(
        stream: list,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            final message = snapshot.data!;
            for (var msg in message) {
              if (msg.user != FirebaseAuth.instance.currentUser!.uid) {
                toRemove.add(msg);
              }
            }
            message.removeWhere((element) => toRemove.contains(element));
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
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              children: message.map(buildReplies).toList(),
                            )))));

          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildReplies(Message message) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.black),
          color: Colors.white.withOpacity(0.7),
        ),
        child: ListTile(
          title: Text(
            message.content,
            style:
                textStyle('JosefinSans', FontWeight.w900, 20.0, Colors.black),
          ),
          subtitle: Text(message.replies.join("\n"),
            style:
                textStyle('JosefinSans', FontWeight.w500, 15.0, Colors.black),
          ),
        ));
  }
}


