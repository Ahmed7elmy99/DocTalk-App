import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/drawer_feature/presentation/screens/drawer.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/home_screen.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/settings_view.dart';
import 'package:doc_talk/features/home_feature/presentation/widgets/custom_button_bottom_app_bar.dart';

import 'package:doc_talk/features/questionair_feature/cubit/states_survey.dart';
import 'package:doc_talk/features/questionair_feature/cubit/survey_cubit.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/q1_screen.dart';
import 'package:doc_talk/survey_results.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const MyDrawer(),
    const HomeScreen(),
    const SettingsView()
  ];

  int currentIndex = 0;

  void changeBottom(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      endDrawer: const MyDrawer(),
      floatingActionButton: SizedBox(
        width: 80.w,
        height: 150.h,
        child:
            BlocConsumer<SurveyCubit, SurveyStates>(listener: (context, state) {
          if (state is SurveyLoadingStates) {
            showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is SurveySuccessStates) {
            navigateTo(
                context: context,
                widget: Q1Screen(
                    surveyModel: SurveyCubit.get(context).surveyModel));
          }
        }, builder: (context, state) {
          var cubit = SurveyCubit.get(context);
          return FloatingActionButton(
            backgroundColor: Color(0xFF2A7473),
            onPressed: () async {
             if (await CashHelper.getString(key:"surveyResult") == null) {
             await cubit.getSurveyData(context: context, id: 1);
   
  } else  {
     navigateTo(context: context, widget: const SurveyResults());
  }
            //  await cubit.getSurveyData(context: context, id: 1);
              // navigateTo(context: context, widget: Q1Screen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/floatingActionButtonIcon.png",
                  width: 24,
                  height: 24,
                ),
                Text(
                  'Servey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
            shape: const CircleBorder(),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: bottomScreens[currentIndex],
      bottomNavigationBar: Stack(
        children: [
          Image.asset(
            "assets/images/groundBottomNav.png",
            height: 130,
            color: Colors.white,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              elevation: 0,
              child: Row(
                children: [
                  Row(
                    children: [
                      CustomButtonBottomAppBar(
                        active: currentIndex == 0,
                        imageUrl: "assets/images/home.png",
                        textButton: "Home",
                        onPressed: () {
                          changeBottom(0);
                        },
                      ),
                      CustomButtonBottomAppBar(
                        active: currentIndex == 1,
                        imageUrl: "assets/images/search.png",
                        textButton: "Explore",
                        onPressed: () {
                          changeBottom(1);
                        },
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomButtonBottomAppBar(
                        active: currentIndex == 2,
                        imageUrl: "assets/images/icon-bookmark.png",
                        textButton: "Library",
                        onPressed: () {
                          changeBottom(2);
                        },
                      ),
                      CustomButtonBottomAppBar(
                        active: currentIndex == 3,
                        imageUrl: "assets/images/profile.png",
                        textButton: "Profile",
                        onPressed: () {
                          changeBottom(3);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
