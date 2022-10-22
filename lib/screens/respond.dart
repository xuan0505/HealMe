import 'package:flutter/material.dart';
import 'package:testheal/screens/catch_star.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testheal/screens/galaxy.dart';
import 'package:testheal/screens/shoot_star.dart';
import 'package:testheal/utils/reusableWidgets.dart';

class Respond extends StatefulWidget {
  const Respond({Key? key}) : super(key: key);

  @override
  State<Respond> createState() => _RespondState();
}

class _RespondState extends State<Respond> {
  final TextEditingController _replyTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Picture2.jpg"),
              fit: BoxFit.cover,
            )),
            child: Stack(
              children: [
                pickMessage(readMessage(), context),
                bigText(_replyTextController, size),
                Align(
                  alignment: const Alignment(0, 0.7),
                  child: GestureDetector(
                    onTap: () {
                      replyMessage(_replyTextController.text);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Galaxy()));
                    },
                    child: starButton("Respond"),
                  ),
                ),
                backButton(context),
              ],
            )));
  }

  StreamBuilder<List<Message>> pickMessage(
      Stream<List<Message>> list, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: list,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            final message = snapshot.data!;
            for (var msg in message) {
              if (msg.msgID == CatchStar.msgID) {
                return Align(
                    alignment: const Alignment(0, -0.65),
                    child: SizedBox(
                        width: size.width * 0.9,
                        height: 3.5 * 24.0,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListTile(
                                  title: Text(msg.content,
                                      style: textStyle('JosefinSans',
                                          FontWeight.w600, 20.0, Colors.black),
                                      textAlign: TextAlign.justify),
                                  contentPadding: const EdgeInsets.all(15.0),
                                )))));
              }

            }
            throw Exception('Error');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  void replyMessage(String replies) {
    final docMessage =
    FirebaseFirestore.instance.collection('messages').doc(CatchStar.msgID);
    docMessage.update({
      'replies': FieldValue.arrayUnion([replies])
    });
  }



}




