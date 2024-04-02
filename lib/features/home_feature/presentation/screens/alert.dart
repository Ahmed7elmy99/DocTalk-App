import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../app/utils/app_colors.dart';
import 'button_widget.dart';
import 'text_widget.dart';

globalAlertDialogue(String title1,
    {
      String? title2,
      VoidCallback? onCancel,
      VoidCallback? onOk,
      String ?okButtonText,
      String ?cancelButtonText,
      IconData? iconData,
      Color? iconDataColor,
      Color? bColor,
      Color? iconBackColor,
      bool canCancel = false,
      bool canGif = false,
      required BuildContext context
    }) {
  showDialog(
    context: context ,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 250,
        width: 450.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              35.verticalSpace,
              canGif?
              Image(
                image: AssetImage("assets/images/thank.gif"),
              ):
              Text(
                title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  // color: AppColors.blue,
                  fontSize: 20.sp,
                ),
              ),
              title2==null?const SizedBox():Text(
                title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(height: 24,),
              canCancel?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      onPressed: onOk?? () {
                        Navigator.pop(context);
                      },
                      color: AppColors.mainColor,
                      child: Center(
                        child: Text(
                          okButtonText??"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: ButtonWidget(
                      onPressed: onCancel?? () {
                        Navigator.pop(context);
                      },
                      mainAxisAlignment: MainAxisAlignment.center,
                      color: Colors.transparent,
                      outlined: false,
                      border: Border.all(color: AppColors.mainColor),
                      text: cancelButtonText,
                      textColor: AppColors.mainColor,
                      textSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
                  :
              ButtonWidget(
                color:bColor?? AppColors.mainColor,
                onPressed: onOk?? () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    okButtonText??"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
              35.verticalSpace,
            ],
          ),
        ),
      );
    },
  );
}