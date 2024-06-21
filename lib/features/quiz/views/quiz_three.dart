import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_colors.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';
import 'quiz_four.dart';

class QuizThreeView extends StatefulWidget {
  const QuizThreeView({Key? key}) : super(key: key);

  @override
  State<QuizThreeView> createState() => _QuizThreeViewState();
}

class _QuizThreeViewState extends State<QuizThreeView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  int _score = 0;
  final String _correctName = 'MOM';

  void _checkName() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (_controller.text.trim().toLowerCase() ==
            _correctName.toLowerCase()) {
          _score = 25;
          print(_score);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizFourView()),
          );
        } else {
          _score = 0;
          print(_score);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizFourView()),
          );
        }
      });
    }
  }

  List<String> questions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: ListView(children: [
          
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.sp, right: 10.sp),
                child: Text(
                  'Quiz 3',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Who is this.?',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              Image.asset('assets/images/Frame 2610771.png'),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
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
                    ])),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 100.sp),
                child: CustomButton(
                  onTap: _checkName,
                  color: AppColors.quizButtonColor,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
