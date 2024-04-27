import 'package:doc_talk/app/utils/app_assets.dart';
import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/default_app_bar_widget.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_button_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';

import 'package:doc_talk/family_screen.dart';
import 'package:doc_talk/features/drawer_feature/presentation/screens/drawer.dart';
<<<<<<< HEAD
import 'package:doc_talk/levels.dart';
=======
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_cubit.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_states.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/screens/levels.dart';
>>>>>>> 50e19007c693bd609949cb0b85fe695c4310292f
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        endDrawer: const MyDrawer(),
        backgroundColor: Colors.green,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AppImages.back)),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.w,
                      left: 16.w,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  DefaultAppBarWidget(
                    title: "Hi, ${CashHelper.getString(key: "name")}",
                    canBack: false,
                    leadingWidth: 0,
                    backColor: Colors.transparent,
                    actionsWidgets: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 20.sp,
                        ),
                        color: AppColors.black,
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      )
                    ],
                  ),
                  36.verticalSpace,
                  SizedBox(
                    height: 150.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigateTo(
                                context: context, widget: const FamilyScreen());
                          },
                          child: Container(
                            width: 100.w,
                            height: 146.h,
                            margin: EdgeInsets.only(left: 16.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                const Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      child: ImageWidget(
                                        imageUrl: AppImages.homeList,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                10.verticalSpace,
                                TextWidget(
                                  title: "Family",
                                  titleSize: 16.sp,
                                  titleColor: AppColors.black,
                                  titleFontWeight: FontWeight.w400,
                                ),
                                10.verticalSpace
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  40.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                    ),
                    child: Row(
                      children: [
                        TextWidget(
                          title: "Learning path",
                          titleSize: 20.sp,
                          titleColor: AppColors.black,
                          titleFontWeight: FontWeight.w400,
                        ),
                        18.horizontalSpace,
                        Container(
                          width: 65.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(color: const Color(0xff2A7473))),
                          child: TextWidget(
                            title: "New",
                            titleSize: 14.sp,
                            titleColor: const Color(0xff2A7473),
                            titleFontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        CustomTextButton(
                          title: "See All",
                          titleSize: 14.sp,
                          titleColor: const Color(0xff2A7473),
                          titleFontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                    ),
                    child: TextWidget(
                      title: "Achieve your learning goals efficiently",
                      titleSize: 14.sp,
                      titleColor: AppColors.black.withOpacity(.4),
                      titleFontWeight: FontWeight.w400,
                    ),
                  ),
                  32.verticalSpace,
                  SizedBox(
                    height: 340.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            index == 0
                                ? navigateTo(
                                    context: context,
                                    widget: const LevelsScreen())
                                : debugPrint('Tapped');
                          },
                          child: Container(
                            width: 337.w,
                            height: 337.h,
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(left: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(AppImages.homeList2))),
                            child: Container(
                              width: double.infinity.w,
                              padding: EdgeInsets.all(16.sp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black.withOpacity(.25)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextWidget(
                                    title:
                                        "Get red of Lisping \nwith practice.",
                                    titleSize: 24.sp,
                                    titleColor: AppColors.white,
                                    titleAlign: TextAlign.start,
                                    titleFontWeight: FontWeight.w600,
                                  ),
                                  16.verticalSpace,
                                  TextWidget(
                                    title: "Speak Activities",
                                    titleSize: 18.sp,
                                    titleColor:
                                        AppColors.white.withOpacity(.85),
                                    titleFontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
=======
        endDrawer: MyDrawer(),
        backgroundColor: Colors.green,
        body: BlocConsumer<LevelsCubit, LevelState>(
          listener: (context, state) {
            if (state is LevelLoading) {
              showDialog(
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else if (state is LevelSuccess) {
              navigateTo(
                  context: context,
                  widget: LevelsScreen(
                      levelsModel: LevelsCubit.get(context).levelModel));
            }
          },
          builder: (context, state) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(AppImages.back)),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.w,
                        left: 16.w,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DefaultAppBarWidget(
                      title: "Hi, ${CashHelper.getString(key: "name")}",
                      canBack: false,
                      leadingWidth: 0,
                      backColor: Colors.transparent,
                      actionsWidgets: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 20.sp,
                          ),
                          color: AppColors.black,
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        )
                      ],
                    ),
                    36.verticalSpace,
                    SizedBox(
                      height: 150.h,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              navigateTo(
                                  context: context,
                                  widget: const FamilyScreen());
                            },
                            child: Container(
                              width: 100.w,
                              height: 146.h,
                              margin: EdgeInsets.only(left: 16.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: ImageWidget(
                                          imageUrl: AppImages.homeList,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  10.verticalSpace,
                                  TextWidget(
                                    title: "Family",
                                    titleSize: 16.sp,
                                    titleColor: AppColors.black,
                                    titleFontWeight: FontWeight.w400,
                                  ),
                                  10.verticalSpace
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    40.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                      ),
                      child: Row(
                        children: [
                          TextWidget(
                            title: "Learning path",
                            titleSize: 20.sp,
                            titleColor: AppColors.black,
                            titleFontWeight: FontWeight.w400,
                          ),
                          18.horizontalSpace,
                          Container(
                            width: 65.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(color: const Color(0xff2A7473))),
                            child: TextWidget(
                              title: "New",
                              titleSize: 14.sp,
                              titleColor: const Color(0xff2A7473),
                              titleFontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          CustomTextButton(
                            title: "See All",
                            titleSize: 14.sp,
                            titleColor: const Color(0xff2A7473),
                            titleFontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                      ),
                      child: TextWidget(
                        title: "Achieve your learning goals efficiently",
                        titleSize: 14.sp,
                        titleColor: AppColors.black.withOpacity(.4),
                        titleFontWeight: FontWeight.w400,
                      ),
                    ),
                    32.verticalSpace,
                    SizedBox(
                      height: 340.h,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              await LevelsCubit.get(context)
                                  .getLevelsData(context: context);
                            },
                            child: Container(
                              width: 337.w,
                              height: 337.h,
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(left: 16.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(AppImages.homeList2))),
                              child: Container(
                                width: double.infinity.w,
                                padding: EdgeInsets.all(16.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.black.withOpacity(.25)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextWidget(
                                      title:
                                          "Get red of Lisping \nwith practice.",
                                      titleSize: 24.sp,
                                      titleColor: AppColors.white,
                                      titleAlign: TextAlign.start,
                                      titleFontWeight: FontWeight.w600,
                                    ),
                                    16.verticalSpace,
                                    TextWidget(
                                      title: "Speak Activities",
                                      titleSize: 18.sp,
                                      titleColor:
                                          AppColors.white.withOpacity(.85),
                                      titleFontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
>>>>>>> 50e19007c693bd609949cb0b85fe695c4310292f
              ),
            ),
          ),
        ));
  }
}
