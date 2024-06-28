import 'package:flutter/material.dart';
import 'package:doc_talk/app/utils/app_assets.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.back), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
