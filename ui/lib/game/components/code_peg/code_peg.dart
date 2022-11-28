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
            if (color == Colors.transparent) ...[
              BoxShadow(
                  color: Colors.brown.shade200,
                  spreadRadius: 0.5,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0.2, 0.3))
            ]
          ]),
    );
  }
}
