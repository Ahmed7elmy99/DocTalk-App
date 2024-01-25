import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListile extends StatelessWidget {
  const CustomListile(
      {super.key, required this.title, required this.onChanged});
  final String title;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0.h,
          ),),
      
      
        trailing: SizedBox(
          width: 20.0.w,
          height: 15.0.h,
          child: Switch(
            activeColor:const Color(0xFF2A7473),
            trackOutlineColor: MaterialStateProperty.all(Colors.green),
            activeTrackColor: Theme.of(context).canvasColor,
            value: true,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class CustomSubTitleListile extends StatelessWidget {
  const CustomSubTitleListile({super.key, required this.subTitle});
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.30,
      child: Text(
        subTitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0.h,
        ),
      ),
    );
  }
}
