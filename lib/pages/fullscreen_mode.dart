import 'package:flutter/material.dart';

class FullScreenMode extends StatelessWidget {
  const FullScreenMode({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Image.network(image),
      ),
    );
  }
}
