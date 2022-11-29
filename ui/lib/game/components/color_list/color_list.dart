import 'package:flutter/widgets.dart';
import 'package:mastermind_ui/constants.dart';

class ColorList extends StatelessWidget {
  const ColorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemBuilder: (context, index) => Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: pegColors[index + 1]),
        ),
        itemCount: pegColors.length - 1,
      ),
    );
  }
}
