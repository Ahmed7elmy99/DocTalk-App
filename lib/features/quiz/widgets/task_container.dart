import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({Key? key, required this.index, required this.widget, })
      : super(key: key);
  final int index;
  final Widget widget;
 // final bool ispassed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin:  EdgeInsets.all(12.sp),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF5F5F5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset("assets/images/Task.png"),
              Text('Task ${index }'),
               SizedBox(width: 50.w), // Spacer for alignment
            ],
          ),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0, // Adjusted for better alignment
            child:widget
            /* ispassed
                ? Image.asset("assets/images/correct image.png",
                    width: 30, height: 30)
                : Image.asset("assets/images/false image.png",
                    width: 30, height: 30)*/),
      ],
    );
  }
}
