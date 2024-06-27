import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({Key? key, required this.index, required this.ispassed})
      : super(key: key);
  final int index;
  final bool ispassed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF5F5F5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset("assets/images/Task.png"),
              Text('Task ${(index + 1)}'),
              const SizedBox(width: 50), // Spacer for alignment
            ],
          ),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0, // Adjusted for better alignment
            child: ispassed
                ? Image.asset("assets/images/correct image.png",
                    width: 30, height: 30)
                : Image.asset("assets/images/false image.png",
                    width: 30, height: 30)),
      ],
    );
  }
}
