import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/categories.dart';
import 'package:doc_talk/result/data/cubit/fetch_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/utils/app_colors.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchDataCubit>(context).fetchLevelsData();
    print('init');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 1.8,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF5B358C),
        child: Stack(
          children: [
            Positioned(
              top: 65.h,
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
            Positioned(
              left: 104.w,
              right: 104.w,
              top: 53.h,
              child: Container(
                width: 230.w,
                height: 230.w,
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 2.w,
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 129.w,
              right: 129.w,
              top: 95.h,
              child: Container(
                width: 170.w,
                height: 170.w,
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 2.w,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 144.w,
              right: 144.w,
              top: 115.h,
              child: Container(
                width: 140.w,
                height: 140.w,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/levelImage.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: CircleBorder(
                    side: BorderSide(width: 2.w, color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12.w,
              top: 349.h,
              child: SizedBox(
                height: 300.h,
                child: Text(
                  "Let's dive into the amazing world and \n learn some awesome words together!\nLet’s start..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: BlocBuilder<FetchDataCubit, FetchDataState>(
          builder: (context, state) {
            if (state is FetchLevelsDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchLevelsDataLoaded) {
              return Column(children: [
                GestureDetector(
                  onTap: () {
                    navigateTo(
                        context: context, widget: const CategoriesScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(32.h),
                            decoration: const BoxDecoration(
                              color: Color(0xFF78C8E3),
                            ),
                            child: Image.asset("assets/images/startericon.png"),
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            'Starter ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 20.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0.h),
                        child: Image.asset("assets/images/chevron-down.png"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.levelsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final level = state.levelsList[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(35.h),
                                decoration: BoxDecoration(
                                    color: level.passed!
                                        ? AppColors.green2
                                        : const Color(0xFFE3672B)),
                                child: level.passed!
                                    ? Image.asset(
                                        "assets/images/startericon.png")
                                    : Image.asset("assets/images/lock.png"),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                level.title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 20.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0.h),
                            child:
                                Image.asset("assets/images/chevron-down.png"),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ]);
            } else if (state is FetchCategoriesDataFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    ]));
  }
}
