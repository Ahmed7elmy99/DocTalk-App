import 'package:flutter/material.dart';

import '../../../app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, this.label,  this.color}) : super(key: key);
  final void Function()? onTap;
  final String? label;
  final dynamic color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: color ?? AppColors.mainColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label ?? 'Next',
          style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
