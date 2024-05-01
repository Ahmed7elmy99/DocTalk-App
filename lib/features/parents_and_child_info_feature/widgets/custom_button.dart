import 'package:doc_talk/app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, this.label}) : super(key: key);
  final void Function()? onTap;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppColors.primaryColor,
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
