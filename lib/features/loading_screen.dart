import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../app/utils/consts.dart';
import 'auth_feature/presentation/screens/login_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  GifController? controller;
  @override
  void initState() {
    controller = GifController(vsync: this);
   /* Future.delayed(const Duration(seconds: 3), () {
      navigateTo(context: context, widget: LoginScreen());
    } */;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9eb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gif(
              image: AssetImage("assets/images/loading.gif"),
              controller:
                  controller, // if duration and fps is null, original gif fps will be used.s
              autostart: Autostart.loop,
              onFetchCompleted: () {
                controller!.reset();
                controller!.forward();
              },
            ),
          ],
        ),
      ),
    );
  }
}
