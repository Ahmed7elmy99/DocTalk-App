
import 'package:flutter/material.dart';

class QuizBackGround extends StatelessWidget {
  const QuizBackGround({
    super.key,
  required this.child,
  });

final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/image 13.png"), // Check image path
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.topCenter,
      child:child
    );
  }
}
