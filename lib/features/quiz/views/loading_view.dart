import 'package:flutter/material.dart';

import 'done_view.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DoneView()),
      );
    });
    return Scaffold(
        backgroundColor: const Color(0xffE9E9EB),
        body: Center(
            child: Image.asset(
                'assets/images/d220b28ec97e9c4d0ea33e3dd45b1d70 1.png')));
  }
}
