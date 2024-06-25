import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';


class WhoIsThisScreen extends StatefulWidget {
  @override
  _WhoIsThisScreenState createState() => _WhoIsThisScreenState();
}

class _WhoIsThisScreenState extends State<WhoIsThisScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  int _score = 0;
  final String _correctName = 'MOM'; // Change this to the name of your image
  final String _imagePath = 'assets/images/Frame 2610771.png'; // Path to your image

  void _checkName() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (_controller.text.trim().toLowerCase() == _correctName.toLowerCase()) {
          _score = 25;
        } else {
          _score = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who is this?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Who is this?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              _imagePath,
              height: 200,
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter name',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _checkName,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  GifController? controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);

    // Start the GIF animation immediately
    controller!.repeat(min: 0, max: 29, period: const Duration(seconds: 1));

    // Perform the API call asynchronously
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate a delay for the API call
    await Future.delayed(const Duration(seconds: 3));
    navigateTo(context: context, widget: DoneView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e9eb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gif(
              image: AssetImage("assets/images/loading.gif"),
              controller: controller,
              autostart: Autostart.loop,
              onFetchCompleted: () {
                controller!.reset();
                controller!.forward();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*void navigateTo({required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}*/

class DoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Done"),
      ),
      body: Center(
        child: Text("Done!"),
      ),
    );
  }
}
class ResultContainer extends StatefulWidget {
  const ResultContainer({
    super.key, 
  });
 //final SurveyResultModel surveyResultModel;

  @override
  State<ResultContainer> createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 407.w,
        height: 229.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          image: const DecorationImage(
              image: AssetImage("assets/images/result_container.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You get  ${CashHelper.getString(key: "surveyResult")} points from 48 ',
                style: TextStyle(fontSize: 28.sp, color: Colors.white),
              ),
              SizedBox(height: 20.h),
              Text("${CashHelper.getString(key: "diagnosis")}"
                ,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 209.h,
            right: 107.84.w,
            left: 107.w,
            child: Container(
              width: 213.16.w,
            height: 116.11.h,
              child: Image.asset(
                "assets/images/image_result_survey.png",
               
              ),
            ),
          ),
          Center(
            child: Container(
              width: 291.w,
              height: 306.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 40.r,
                    offset: Offset(0, 4.h),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'You get ${CashHelper.getString(key: "surveyResult")} points from 48 ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5.h,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'we will recommend some exercises for your child to help improve his ability in talking',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xE51E1E1E),
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.5.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 /* SizedBox(height: 24.h),
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2A7473),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Back to home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1.2.h,
                            letterSpacing: -0.14.w,
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 16.sp,),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Test2Screen extends StatelessWidget {
  const Test2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 209.h,
            right: 107.84.w,
            left: 107.w,
            child: Container(
              width: 213.16.w,
            height: 116.11.h,
              child: Image.asset(
                "assets/images/image_result_survey.png",
              
              ),
            ),
          ),
          Center(
            child: Container(
              width: 291.w,
              height: 306.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 40.r,
                    offset: Offset(0, 4.h),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'You get ${CashHelper.getString(key: "surveyResult")} points from 48 ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.5.h,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'we will recommend some exercises for your child to help improve his ability in talking',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xE51E1E1E),
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.5.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF2A7473),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Back to home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1.2.h,
                            letterSpacing: -0.14.w,
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 16.sp,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



