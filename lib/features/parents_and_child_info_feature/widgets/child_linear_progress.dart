import 'package:doc_talk/app/utils/colors.dart';
import 'package:doc_talk/app/utils/size.dart';
import 'package:flutter/material.dart';

class ChildlinearProgressWidget extends StatelessWidget {
  const ChildlinearProgressWidget({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          color: AppColors.primaryColor,
          value: value,
          minHeight: 5,
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Child info",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}