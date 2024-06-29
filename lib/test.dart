import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/stories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_cubit.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gif/gif.dart';

import 'package:doc_talk/app/utils/app_assets.dart';
import 'features/home_feature/presentation/screens/bottom_nav_bar.dart';

class WhoIsThisScreen extends StatefulWidget {
  @override
  _WhoIsThisScreenState createState() => _WhoIsThisScreenState();
}

class _WhoIsThisScreenState extends State<WhoIsThisScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  int _score = 0;
  final String _correctName = 'MOM'; // Change this to the name of your image
  final String _imagePath =
      'assets/images/Frame 2610771.png'; // Path to your image

  void _checkName() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (_controller.text.trim().toLowerCase() ==
            _correctName.toLowerCase()) {
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

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
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
              Text(
                "${CashHelper.getString(key: "diagnosis")}",
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Survey Result',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 1.sp,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            //  Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavBar()));
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black.withOpacity(.9),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.back), fit: BoxFit.cover),
        ),
        child: Stack(
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
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                      },
                      child: Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
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
                            SizedBox(
                              width: 8.w,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Test2Screen extends StatefulWidget {
  const Test2Screen({Key? key, required this.storiesModel}) : super(key: key);

  final List<StoriesModel> storiesModel;

  @override
  State<Test2Screen> createState() => _Test2ScreenState();
}

class _Test2ScreenState extends State<Test2Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ahmed();
    });
  }

  Future<void> ahmed() async {
    await LevelsCubit.get(context).getFavoritesStories(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Saved Stories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 1.sp,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavBar()));
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black.withOpacity(.9),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<LevelsCubit, LevelState>(
        listener: (context, state) {
          if (state is FavoritesLoading) {
            showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          }
          if (state is FavoritesSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (storiesModel1.isNotEmpty) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/backgroundCategoriesScreen.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 140.h),
                child: GridView.builder(
                  padding: EdgeInsets.all(
                      10.sp), // Adding some padding to the GridView
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 40.w, // Spacing of 40 from the right
                    mainAxisSpacing: 24.17.h, // Spacing of 24 from the bottom
                    childAspectRatio: 0.7,
                  ),
                  itemCount: storiesModel1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        /*   navigateTo(
                      context: context,
                      widget: FamilyScreen(
                        storiesModel: storiesModel,
                        index: index,
                        categoryiesModel: categoryiesModel,
                        index2: index2,
                      )
                      );*/
                      },
                      child: Container(
                        width: 99.w,
                        height: 146.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.sp),
                                topRight: Radius.circular(20.sp),
                              ),
                              child: Image.network(
                                "${storiesModel1[index].image}",
                                width: 99.w,
                                height: 102.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Expanded(
                              child: TextWidget(
                                title: "${storiesModel1[index].title}",
                                titleSize: 16.sp,
                                titleColor: Colors.black,
                                titleFontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else  {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.back), fit: BoxFit.cover),
              ),
              child: Center(
                child: Container(
                  width: 291.w,
                  height: 306.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 259.w,
                        child: Text(
                          'There are no Saved Stories yet. Unlock your stories to be able to save them.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar()));
                        },
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
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
                              SizedBox(
                                width: 8.w,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
