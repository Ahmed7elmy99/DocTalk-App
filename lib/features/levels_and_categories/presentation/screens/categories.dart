import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/categories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/story_cubit.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/screens/family_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categoriesModel});
  final List<CategoryiesModel> categoriesModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryCubit, StoryState>(
      listener: (context, state) {
        if (state is StoryLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is StoryLoaded) {
          navigateTo(context: context, widget: FamilyScreen());
        } else if (state is StoryFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage.toString())));
        }
      },
      builder: (context, state) {
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
                image:
                    AssetImage('assets/images/backgroundCategoriesScreen.png'),
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
              itemCount: categoriesModel.length, // Total number of items
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10.w),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      await context
                          .read<StoryCubit>()
                          .getStoryByCategoryId(categoriesModel[index].id!);
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
                                topLeft:
                                    Radius.circular(ScreenUtil().setWidth(20)),
                                topRight:
                                    Radius.circular(ScreenUtil().setWidth(20)),
                              ),
                              child: Image.network(
                                "${categoriesModel[index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10)),
                          TextWidget(
                            title: "${categoriesModel[index].title}",
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
      },
    );
  }
}