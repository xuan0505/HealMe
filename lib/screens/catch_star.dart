import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testheal/screens/galaxy.dart';
import 'package:testheal/screens/shoot_star.dart';
import 'package:testheal/screens/respond.dart';
import 'package:testheal/utils/color.dart';
import 'package:testheal/utils/reusableWidgets.dart';

class CatchStar extends StatefulWidget {
  const CatchStar({Key? key}) : super(key: key);

  @override
  State<CatchStar> createState() => _CatchStarState();
  static String msgID = '';
  static String userID = '';
}

class _CatchStarState extends State<CatchStar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: [
              Align(
                  alignment: const Alignment(0, -0.75),
                  child: title("Pick a Star", 30.0)),
              Align(
                alignment: const Alignment(-0.8, -0.78),
                child: SizedBox(
                  width: size.width * 0.15,
                  child: Image.asset("assets/images/star.png"),
                ),
              ),
              Align(
                alignment: const Alignment(0.8, -0.78),
                child: SizedBox(
                  width: size.width * 0.15,
                  child: Image.asset("assets/images/star.png"),
                ),
              ),
              StreamBuilder<List<Message>>(
                  stream: readMessage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong!');
                    } else if (snapshot.hasData) {
                      final message = snapshot.data!;
                      return Align(
                          alignment: const Alignment(0, 0.65),
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
                                        children:
                                            message.map(buildMessage).toList(),
                                      )))));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
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
            ],
          )),
    );
  }

  Widget buildMessage(Message message) => Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black),
        color: Colors.white.withOpacity(0.7),
      ),
      child: ListTile(
          title: Text(
            message.content,
            style:
                textStyle('JosefinSans', FontWeight.w500, 15.0, Colors.black),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Respond()));
            CatchStar.msgID = message.msgID;
          }));
}
