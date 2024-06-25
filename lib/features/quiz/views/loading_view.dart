import 'package:doc_talk/app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import 'done_view.dart';

/*class LoadingScreen extends StatefulWidget {
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
    Future.delayed(const Duration(seconds: 3), () {
      navigateTo(context: context, widget: DoneView());
    });
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
}*/
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  late GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.repeat(min: 0, max: 29, period: Duration(seconds: 1));
    });
    Future.delayed(const Duration(seconds: 3), () {
      navigateTo(context: context, widget: DoneView());
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
              controller: controller,
              autostart: Autostart.loop,
            ),
          ],
        ),
      ),
    );
  }
}

/*void navigateTo({required BuildContext context, required Widget widget}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => widget),
  );
}*/


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
