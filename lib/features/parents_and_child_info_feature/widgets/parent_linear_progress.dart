import 'package:doc_talk/app/utils/colors.dart';
import 'package:doc_talk/app/utils/size.dart';
import 'package:flutter/material.dart';

class ParentLinearProgress extends StatelessWidget {
  const ParentLinearProgress({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: mQWidth(context) / 2.7,
          child: LinearProgressIndicator(
            color: AppColors.primaryColor,
            value: value,
            minHeight: 5,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
