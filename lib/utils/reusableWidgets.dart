import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testheal/screens/shoot_star.dart';
import 'package:testheal/utils/color.dart';
import 'package:testheal/screens/navigation.dart';

TextStyle textStyle(String family, weight, size, fontColor) {
  return TextStyle(
    fontFamily: family,
    fontWeight: weight,
    fontSize: size,
    color: fontColor,
    height: 1.15,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, TextInputType inputType) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: inputType,
  );
}

Container specButton(String string) {
  return Container(
    height: 50,
    width: 150,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: HexColor.fromHex("B057D2"), width: 8),
        borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Text(string,
            style: textStyle('JosefinSans', FontWeight.w500, 25.0,
                HexColor.fromHex("B057D2")))),
  );
}

Container starButton(String string) {
  return Container(
    height: 50,
    width: 150,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: HexColor.fromHex("F8CC33"), width: 8),
        borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Text(string,
            style: textStyle('JosefinSans', FontWeight.w500, 18.0,
                HexColor.fromHex("F8CC33")))),
  );
}

Align backButton(BuildContext context) {
  return Align(
      alignment: const Alignment(-0.9, -0.9),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ));
}

Align backButtonHome(BuildContext context) {
  return Align(
      alignment: const Alignment(-0.9, -0.9),
      child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Navigation()));
          }));
}

AlertDialog errorPop(dynamic errorMsg, BuildContext context) {
  return AlertDialog(
    title: Text(
      "Error",
      style: textStyle('JosefinSans', FontWeight.w900, 25.0, Colors.black),
    ),
    content: Text(errorMsg,
        style: textStyle('JosefinSans', FontWeight.bold, 15.0, Colors.black)),
    actions: [
      SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            shape:
                const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: HexColor.fromHex("B057D2"),
            child: const Text("OK"),
          ))
    ],
  );
}

Align bigText(TextEditingController controller, Size size) {
  return Align(
      alignment: const Alignment(0, 0),
      // child: SizedBox(
      //   height: 10 * 24.0,
      //   width: size.width * 0.9,
      child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: 10 * 24.0, maxWidth: size.width * 0.9),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TextField(
              controller: controller,
              maxLines: 10,
              enableSuggestions: true,
              autocorrect: true,
              cursorColor: Colors.white,
              textAlign: TextAlign.justify,
              style:
                  textStyle('JosefinSans', FontWeight.w500, 20.0, Colors.black),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                labelText: "Type your message here...",
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 18.0),
                alignLabelWithHint: true,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.75),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
              ),
              keyboardType: TextInputType.text,
            ),
          )));
}

Stream<List<Message>> readMessage() {
  return FirebaseFirestore.instance
      .collection('messages')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList());
}

Text title(String text, double fontsize) {
  return Text(
    text, style: textStyle('JosefinSans', FontWeight.bold, fontsize, Colors.white),
  );
}

