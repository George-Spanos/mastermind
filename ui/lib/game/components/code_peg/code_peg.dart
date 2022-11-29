import 'package:flutter/material.dart';

class CodePeg extends StatelessWidget {
  final Color color;
  const CodePeg({super.key, this.color = Colors.transparent});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Colors.brown.shade800, width: 2.5),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.shade300,
              blurRadius: 3,
              blurStyle: BlurStyle.outer,
            )
          ]),
    );
  }
}
