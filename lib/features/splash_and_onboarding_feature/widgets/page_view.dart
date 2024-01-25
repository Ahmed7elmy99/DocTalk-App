import 'package:doc_talk/features/splash_and_onboarding_feature/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController!,
      children: [
        PageViewItem(
          height: 402.70001.h,
          width: 291.w,
          image: "assets/images/onboarding1.png",
          title: "Safe Environment",
          subTitle: "Rest assured, your children are safe",
        ),
        PageViewItem(
          height: 402.70001.h,
          width: 291.w,
          image: "assets/images/onboarding2.png",
          title: "Learn in Arabic",
          subTitle: "Alongside English",
        ),
        PageViewItem(
          height: 402.70001.h,
          width: 291.w,
          image: "assets/images/onboarding3.png",
          title: "+500 Learning activities",
          subTitle: "Discover new content every week",
        ),
      ],
    );
  }
}
