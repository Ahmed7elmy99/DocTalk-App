import 'package:doc_talk/app/utils/bloc_observer.dart';
import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/auth_feature/presentation/cubit/auth_cubit.dart';

import 'package:doc_talk/features/home_feature/presentation/screens/bottom_nav_bar.dart';

import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_cubit.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/story_cubit.dart';

import 'package:doc_talk/features/questionair_feature/cubit/survey_cubit.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/last_screens/go_to_quiz_screen.dart';
import 'package:doc_talk/features/quiz/cubit/quiz_cubit.dart';
import 'package:doc_talk/features/quiz/views/done_view.dart';
import 'package:doc_talk/features/quiz/views/quiz_five_view.dart';
import 'package:doc_talk/features/quiz/views/quiz_four.dart';
import 'package:doc_talk/features/quiz/views/quiz_one.dart';
import 'package:doc_talk/features/quiz/views/quiz_three.dart';
import 'package:doc_talk/features/splash_and_onboarding_feature/presentation/screens/splash_screen.dart';
import 'package:doc_talk/test.dart';





//import 'package:doc_talk/test.dart';

//import 'package:doc_talk/test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/questionair_feature/cubit/quiz_cubit.dart';



//new
//nwe2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CashHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SurveyCubit(),
        ),
                BlocProvider(
          create: (BuildContext context) => StoryCubit(),
        ),

        BlocProvider(
          create: (BuildContext context) => LevelsCubit()
            ..getCategoriesHomeData(context: context, levelId: 1),
        ),
        BlocProvider(
          create: (BuildContext context) => QuizCubit(),
        ),
          BlocProvider(
          create: (BuildContext context) => QuizCubit2(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

//new version
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        // designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return child!;
        },
        child: GetMaterialApp(
          theme: ThemeData(
            fontFamily: "Poppins",
            //  scaffoldBackgroundColor: AppColors.scaffoldBackGround,
            sliderTheme: const SliderThemeData(
                //  thumbColor: Colors.transparent, // Set thumb color to transparent
                ),
          ),
          debugShowCheckedModeBanner: false,
  
          home://Test2Screen()
             
           CashHelper.getString(key: "token") == null
                  ? const SplashScreen()
                  : const BottomNavBar(),
        ));
  }
}
//Shift + Alt + F 
//donennnnn