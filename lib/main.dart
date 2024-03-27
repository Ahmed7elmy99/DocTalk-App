
import 'package:doc_talk/levels.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

//new
//nwe2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
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
        home://FamilyScreen()
      //  CategoriesScreen()
        LevelsScreen(),
        // const SplashScreen(),
      ),
    );
  }
}
//Shift + Alt + F 