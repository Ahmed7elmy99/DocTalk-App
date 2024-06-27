import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/utils/consts.dart';

import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/family_screen.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/categories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_cubit.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_states.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/screens/stories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categoriesModel});
  final List<CategoryiesModel> categoriesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 1.sp,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black.withOpacity(.9),
            ),
          ),
        ),
        body: BlocConsumer<LevelsCubit, LevelState>(
          listener: (context, state) {
            if (state is StoriesLoading) {
              showDialog(
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );

            } else if (state is StoriesSuccess) {
                            Navigator.pop(context);
                int selectedIndex = LevelsCubit.get(context).selectedIndex;
              navigateTo(
                context: context,
                widget: StoriesScreen(
                  storiesModel: LevelsCubit.get(context).storiesModel,
                  categoryiesModel: LevelsCubit.get(context).categoryiesModel ,
                  index2: selectedIndex,
                ),
              );
              
            }
          },
          builder: (context, state) => Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/backgroundCategoriesScreen.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 140.h),
              child: GridView.builder(
                padding: EdgeInsets.all(
                    10.sp), // Adding some padding to the GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 40.w, // Spacing of 40 from the right
                  mainAxisSpacing: 24.17.h, // Spacing of 24 from the bottom
                  childAspectRatio: 0.7,
                ),
                itemCount: categoriesModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                        LevelsCubit.get(context).setSelectedIndex(index);
                      await LevelsCubit.get(context).getStoriesByCategoryId(
                        context: context,
                        CategoryId: categoriesModel[index].id!,
                      );
                      // navigateTo(context: context, widget: FamilyScreen());
                    },
                    child: Container(
                      width: 99.w,
                      height: 146.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.sp),
                              topRight: Radius.circular(20.sp),
                            ),
                            child: Image.network(
                              "${categoriesModel[index].image}",
                              width: 99.w,
                              height: 102.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: TextWidget(
                              title: "${categoriesModel[index].title}",
                              titleSize: 16.sp,
                              titleColor: Colors.black,
                              titleFontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
