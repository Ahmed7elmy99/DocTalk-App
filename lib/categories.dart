import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/family_screen.dart';
import 'package:doc_talk/result/data/cubit/fetch_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchDataCubit>(context).fetchCategoriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.black.withOpacity(.9),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundCategoriesScreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<FetchDataCubit, FetchDataState>(
          builder: (context, state) {
            if (state is FetchCategoriesDataLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FetchCategoriesDataLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: ScreenUtil().setWidth(10),
                  mainAxisSpacing: ScreenUtil().setWidth(10),
                  childAspectRatio: 0.7,
                ),
                itemCount: state.categoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = state.categoriesList[index];
                  return Padding(
                    padding: EdgeInsets.all(10.w),
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        navigateTo(
                            context: context, widget: const FamilyScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(20)),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      ScreenUtil().setWidth(20)),
                                  topRight: Radius.circular(
                                      ScreenUtil().setWidth(20)),
                                ),
                                child: ImageWidget(
                                  imageUrl: category.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            TextWidget(
                              title: category.title!,
                              titleSize: 16.sp,
                              titleColor: AppColors.black,
                              titleFontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
