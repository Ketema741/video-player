import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
          child: Text(
        "Settings",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 30,
        ),
      )),
    );
  }
}