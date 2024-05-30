import 'package:doc_talk/features/auth_feature/presentation/screens/welcome_screen.dart';
import 'package:doc_talk/features/splash_and_onboarding_feature/widgets/custom_indicator.dart';
import 'package:doc_talk/features/splash_and_onboarding_feature/widgets/page_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_onboarding.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            CustomPageView(
              pageController: pageController,
            ),
            SizedBox(height: 64.h),
            Positioned(
              bottom: 203.51.h,
              left: 0.w,
              right: 0.w,
              child: Center(
                child: CustomIndicator(
                  dotIndex: pageController!.hasClients
                      ? pageController!.page!.toInt()
                      : 0,
                ),
              ),
            ),
            Positioned(
              top: 71.99.h,
              right: 2.w,
              child: MaterialButton(
                onPressed: () {
                  Get.to(
                    () => const WelcomeScreen(),
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    color: const Color(0xff2a7473),
                    decorationColor: const Color(0xff2a7473),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            if (pageController!.hasClients && pageController!.page == 2)
              Positioned(
                bottom: 119.16.h,
                left: 114.w,
                right: 114.w,
                child: Center(
                  child: Container(
                    width: 170.w,
                    height: 60.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF2A7473),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2a7473),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Let’s start',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.h,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.to(
                          () => const WelcomeScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                    ),
                  ),
                ),
              )
            else
              Positioned(
                bottom: 108.81.h,
                left: 178.62.w,
                right: 178.62.w,
                child: Center(
                  child: Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2A7473),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: () {
                        if (pageController!.page! < 2) {
                          pageController!.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
