import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/colors.dart';

import 'package:doc_talk/features/home_feature/presentation/widgets/child_details.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/second_settings_container.dart';
import '../widgets/settings_container.dart';
import '../widgets/third_settings_conatiner.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.back,
              color: AppColors.blackColor.withOpacity(.9)),
        ),
      ),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
              image:NetworkImage("${CashHelper.getString(key: 'image')}"),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 32.0.sp, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ChildDetails(),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  'My Child',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const FirstSettingsContainer(),
                SizedBox(
                  height: 20.h,
                ),
                const SecondSettingsContainer(),
                SizedBox(
                  height: 20.h,
                ),
                const ThirdSettingsContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
