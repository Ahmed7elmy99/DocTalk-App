// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButtonBottomAppBar extends StatelessWidget {
  final Function()? onPressed;
  final String imageUrl;
  final String textButton;
  final bool active;

  const CustomButtonBottomAppBar({
    Key? key,
    required this.onPressed,
    required this.imageUrl,
    required this.textButton,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imageUrl,
              color: active ? Color(0xFF6A9E9D) : Color(0xFFD4E3E3)),
          Text(
            textButton,
            style: TextStyle(
                color: active ? Color(0xFF6A9E9D) : Color(0xFFD4E3E3)),
          ),
        ],
      ),
    );
  }
}
