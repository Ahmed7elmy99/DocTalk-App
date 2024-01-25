import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import 'text_widget.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool actions;
  final bool notify;
  final bool? centerTitle;
  final Widget? leading;
  final bool shapeBorder;
  final Widget? titleWidget;
  final VoidCallback? onPop;
  final VoidCallback? actionsOnPressed;
  final bool canBack;
  final Color? backColor;
  final double? leadingWidth;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final List<Widget>? actionsWidgets;
  final FontWeight? titleFontWeight;
  final  double? titleSize;

  const DefaultAppBarWidget({
    this.title,
    this.actions = false,
    Key? key,
    this.onPop,
    this.canBack = true,
    this.leading,
    this.notify = true,
    this.actionsOnPressed,
    this.titleWidget,
    this.leadingWidth,
    this.actionsWidgets,
    this.backColor,
    this.systemUiOverlayStyle,
    this.centerTitle,
    this.shapeBorder = false,
    this.titleFontWeight, this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      
      shape: shapeBorder
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ))
          : const RoundedRectangleBorder(),
      centerTitle: centerTitle,
      systemOverlayStyle: systemUiOverlayStyle,
      backgroundColor: backColor,
      
      leading: canBack
          ? IconButton(
              alignment: Alignment.center,
              onPressed: onPop ??
                  () {
                    Navigator.pop(context);
                  },
              icon: leading ??
                  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black101010,
                    size: 20.sp,
                  ),
            )
          : null,
      title: titleWidget ??
          TextWidget(
              title: title ?? "",
              titleSize:titleSize??20.sp,
              titleFontWeight: titleFontWeight ?? FontWeight.w400,
              titleColor: AppColors.black101010),
      actions: actions
          ? [
              Container(
                width: 48.w,
                height: 48.h,
                margin: EdgeInsetsDirectional.symmetric(
                    vertical: 5.h, horizontal: 14.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.gery455.withOpacity(.05)),
                child: notify
                    ? Stack(
                        alignment: Alignment.topRight,
                        children: [
                          IconButton(
                            onPressed: actionsOnPressed ?? () {},
                            icon: Icon(
                              Icons.notifications,
                              color: AppColors.gery455,
                              size: 30.sp,
                            ),
                          ),
                          Positioned(
                            right: 10.w,
                            top: 10.h,
                            child: CircleAvatar(
                              radius: 4.r,
                              backgroundColor: AppColors.red,
                            ),
                          )
                        ],
                      )
                    : IconButton(
                        onPressed: actionsOnPressed ?? () {},
                        icon: Icon(
                          Icons.notifications,
                          color: AppColors.gery455,
                          size: 30.sp,
                        ),
                      ),
              )
            ]
          : actionsWidgets,
      leadingWidth: leadingWidth,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 66);
}
