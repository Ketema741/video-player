import 'package:flutter/material.dart';

class FrequentWatch extends StatelessWidget {
  const FrequentWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
          child: Text(
        "No recently  watched video",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 30,
        ),
      )),
    );
  }
}