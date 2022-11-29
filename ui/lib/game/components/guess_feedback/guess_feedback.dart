import 'package:flutter/material.dart';
import 'package:mastermind_ui/game/models.dart';

class GuessFeedbackComponent extends StatelessWidget {
  final GuessFeedback feedback;
  const GuessFeedbackComponent({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    final blackPegs = feedback.blackSpots;
    final whitePegs = feedback.whiteSpots;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            width: 15,
            height: 15,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
          ),
          itemCount: blackPegs,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Flexible(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            width: 5,
            height: 5,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            width: 15,
            height: 15,
            decoration:
                const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          ),
          itemCount: whitePegs,
        ),
      ),
    ]);
  }
}
