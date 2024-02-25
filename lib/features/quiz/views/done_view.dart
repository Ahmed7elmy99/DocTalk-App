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
            padding: const EdgeInsets.all(60.0),
            child: Image.asset('assets/images/Avatars1.png',width:150),
          ),
           SizedBox(height:50.h),
          Text('Good jop,Rahma..',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.sp),),
          Spacer(),
          Image.asset('assets/images/Frame 2610807.png',width: double.infinity,fit: BoxFit.cover,),

        ],
      )),
    );
  }
}