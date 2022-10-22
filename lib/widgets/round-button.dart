import 'package:flutter/material.dart';
import 'package:testheal/utils/color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: HexColor.fromHex("B057D2"),
        child: Icon(
          icon,
          size: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}