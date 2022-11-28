import 'package:flutter/material.dart';

class CodeFeedback extends StatelessWidget {
  final int blackPegs;
  final int whitePegs;
  const CodeFeedback({super.key, this.blackPegs = 0, this.whitePegs = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Flexible(child: SizedBox(width: 15)),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                width: 5,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
              ),
              itemCount: blackPegs,
            ),
          ),
          const Flexible(
            child: SizedBox(
              width: 5,
            ),
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
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
              itemCount: whitePegs,
            ),
          ),
          const Flexible(child: SizedBox(width: 15)),
        ]),
      ),
    );
  }
}
