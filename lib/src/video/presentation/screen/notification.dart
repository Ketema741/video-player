import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
          child: Text(
        "No notification yet",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 30,
        ),
      )),
    );
  }
}