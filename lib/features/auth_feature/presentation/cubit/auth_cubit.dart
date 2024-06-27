import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/auth_feature/data/model/user_model.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/reset_password_screen.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/bottom_nav_bar.dart';
import 'package:doc_talk/features/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/otp_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController nameCon = TextEditingController();
  TextEditingController signupEmailCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController conFirmPasswordCon = TextEditingController();

  TextEditingController loginEmailCon = TextEditingController();
  TextEditingController loginPasswordCon = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController resetPassEmailCon = TextEditingController();
  TextEditingController otpCon = TextEditingController();

  TextEditingController newPassCon = TextEditingController();
  TextEditingController confirmNewPassCon = TextEditingController();

  UserModel? userModel;
  bool isVisiable = true;
  bool isConfirm = true;
  String? avatarPath;
  void changePass() {
    isVisiable = !isVisiable;
    emit(AuthInitial());
  }

  void changeIsConfirm() {
    isConfirm = !isConfirm;
    emit(AuthInitial());
  }

  void signup({
    required BuildContext context,
    required String name,
    required String image,
    required String gender,
    required int age,
  }) {
    emit(AuthLoading());
    DioHelper.postData(
      url: "http://130.61.130.252/api/auth/signup",
      data: {
        "name": name,
        "email": signupEmailCon.text,
        "age": age,
        "phone": "+2${phoneCon.text}",
        "gender": gender,
        "password": passwordCon.text,
        "image": image
      },
    ).then((value) {
      print(value.data);
      print("from Success");
      navigateTo(context: context, widget: const LoadingScreen());
      emit(AuthSuccess());
    }).catchError((e) {
      print(e);
      emit(AuthError());
    });
  }

  late String token;
  login(BuildContext context) async {
    if (formstate.currentState!.validate()) {
      emit(AuthLoading());
      await DioHelper.postData(
        url: "http://130.61.130.252/api/auth/login",
        data: {
          "email": loginEmailCon.text,
          "password": loginPasswordCon.text,
        },
      ).then((value) async {
        userModel = UserModel.fromJson(value.data);
        await CacheHelper.setString(key: "token", value: userModel?.token);
        CacheHelper.setString(
            key: "surveyResult",
            value: userModel?.patient?.surveyResult.toString());
        CacheHelper.setString(
            key: "diagnosis", value: userModel?.patient?.diagnoses.toString());
        CacheHelper.setString(
            key: "name", value: userModel?.patient?.name.toString());
        CacheHelper.setInt(key: "id", value: userModel?.patient?.id);
        CacheHelper.setString(
            key: "image", value: userModel?.patient?.image.toString());

        print(userModel?.token);
        navigateAndRemove(context: context, widget: const BottomNavBar());
        emit(AuthSuccess());
      }).catchError((e) {
        print(e.toString());
        emit(AuthError());
      });
    }
  }

  void resetPassEmail(BuildContext context) {
    emit(AuthLoading());
    DioHelper.postData(
      url: "http://130.61.130.252/api/auth/request-reset-token",
      data: {"email": resetPassEmailCon.text},
    ).then((value) {
      print(value.data);
      navigateTo(context: context, widget: const OtpScreen());
    }).catchError((e) {
      print(e.toString());
      emit(AuthInitial());
    });
  }

  void verifyOtp(BuildContext context) {
    emit(AuthLoading());
    DioHelper.postData(
      url: "http://130.61.130.252/api/auth/verify-reset-token",
      data: {"email": resetPassEmailCon.text, "token": otpCon.text},
    ).then((value) {
      print(value.data);
      navigateTo(context: context, widget: const ResetPasswordScreen());
    }).catchError((e) {
      print(e.toString());
      emit(AuthInitial());
    });
  }

  void resetPassword(BuildContext context) {
    emit(AuthLoading());
    DioHelper.patchData(
      url: "http://130.61.130.252/api/auth/reset-password",
      data: {"email": resetPassEmailCon.text, "password": newPassCon.text},
    ).then((value) {
      print(value.data);
      navigateAndRemove(context: context, widget: const LoginScreen());
    }).catchError((e) {
      print(e.toString());
      emit(AuthInitial());
    });
  }
}
