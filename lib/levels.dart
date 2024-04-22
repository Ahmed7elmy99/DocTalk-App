import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/categories.dart';
import 'package:doc_talk/result/data/cubit/fetch_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              return const CircularProgressIndicator();
            } else if (state is FetchLevelsDataLoaded) {
              
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        navigateTo(
                            context: context, widget: const CategoriesScreen());
                      },
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                // shape: BoxShape.circle,
                                color: Color(0xFF78C8E3),
                              ),
                              child:
                                  Image.asset("assets/images/startericon.png"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: const BoxDecoration(
                                  // shape: BoxShape.circle,
                                  // color: Colors.orange,
                                  ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 24.w, right: 8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                    Image.asset(
                                        "assets/images/chevron-down.png")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              //   shape: BoxShape.circle,
                              color: Color(0xFFF3C637),
                            ),
                            child:state.levelsList[0].passed! ?Image.asset("assets/images/startericon.png") : Image.asset("assets/images/lock.png"),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                                //  shape: BoxShape.circle,
                                // color: Colors.white,
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.levelsList[0].title!,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: const Color(0xFF1E1E1E),
                                      fontSize: 20.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Image.asset("assets/images/chevron-down.png")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              //  shape: BoxShape.circle,
                              color: Color(0xFFE3672B),
                            ),
                            child: state.levelsList[1].passed! ?Image.asset("assets/images/startericon.png") : Image.asset("assets/images/lock.png"),
                          
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                                //  shape: BoxShape.circle,
                                //  color: Colors.white,
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                                                        state.levelsList[1].title!,

                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: const Color(0xFF1E1E1E),
                                      fontSize: 20.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Image.asset("assets/images/chevron-down.png")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              //   shape: BoxShape.circle,
                              color: Color(0xFF6D6A99),
                            ),
                            child:state.levelsList[2].passed! ?Image.asset("assets/images/startericon.png") : Image.asset("assets/images/lock.png"),
                          
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                                //  shape: BoxShape.circle,
                                //  color: Colors.orange,
                                ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                                                  state.levelsList[2].title!,

                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: const Color(0xFF1E1E1E),
                                      fontSize: 20.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Image.asset("assets/images/chevron-down.png")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              //   shape: BoxShape.circle,
                              color: Color(0xFF10ABA1),
                            ),
                            child:state.levelsList[2].passed! ?Image.asset("assets/images/startericon.png") : Image.asset("assets/images/lock.png"),
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
