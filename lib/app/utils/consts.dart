import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

void navigateAndRemove({required BuildContext context , required Widget widget}){
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget,),
          (Route<dynamic> route)=>false
  );
}

void navigateTo({required BuildContext context , required Widget widget}){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => widget,),
  );
}

Widget loading(BuildContext context)=>const Center(child: CircularProgressIndicator(backgroundColor: AppColors.mainColor,));