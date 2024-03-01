import 'package:bloc/bloc.dart';
import 'package:doc_talk/features/auth_feature/presentation/cubit/auth_cubit.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/home_screen.dart';
import 'package:doc_talk/features/splash_and_onboarding_feature/presentation/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/utils/cach_helper.dart';
import 'app/utils/dio_helper.dart';

//new
//nwe2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider (
        create: (BuildContext context) => AuthCubit(),
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
        home:
        CashHelper.getString(key: "token") == null?
        const SplashScreen(): const HomeScreen(),
      ),
    );
  }
}
//Shift + Alt + F 