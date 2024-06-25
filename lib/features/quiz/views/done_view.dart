import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/background_widget.dart';

class DoneView extends StatelessWidget {
const DoneView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: QuizBackGround(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(top: 200.h),
            child: Image.asset('assets/images/Avatars1.png',width:200.w,height: 200.h,),
          ),
           SizedBox(height:50.h),
          Text('Good jop,${CashHelper.getString(key: "name")}..',style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Poppins',
fontSize: 24.sp,color: Colors.black,),),
          Spacer(),
          Image.asset('assets/images/Frame 2610807.png',width: double.infinity,fit: BoxFit.cover,),

        ],
      )),
    );
  }
}