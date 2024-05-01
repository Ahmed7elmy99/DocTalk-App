import 'package:doc_talk/app/utils/app_assets.dart';
import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/levels_and_categories/presentation/screens/family_screen.dart';

class StarterCategoriesScreen extends StatelessWidget {
  const StarterCategoriesScreen({Key? key}) : super(key: key);

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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: ScreenUtil().setWidth(10),
            mainAxisSpacing: ScreenUtil().setWidth(10),
            childAspectRatio: 0.7,
          ),
          itemCount: 12, // Total number of items
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(10.w),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  navigateTo(
                      context: context,
                      widget: const FamilyScreen(
                        storiesModel: [],
                      ));
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
                            topLeft: Radius.circular(ScreenUtil().setWidth(20)),
                            topRight:
                                Radius.circular(ScreenUtil().setWidth(20)),
                          ),
                          child: const ImageWidget(
                            imageUrl: AppImages.homeList,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      TextWidget(
                        title: "Family",
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
        ),
      ),
    );
  }
}
