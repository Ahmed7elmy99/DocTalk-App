import 'package:bloc/bloc.dart';
import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/auth_feature/data/model/user_model.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/reset_password_screen.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/home_screen.dart';
import 'package:doc_talk/features/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../questionair_feature/presentation/screens/q1_screen.dart';
import '../screens/otp_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) =>  BlocProvider.of(context);
  TextEditingController nameCon = TextEditingController();
  TextEditingController signupEmailCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController conFirmPasswordCon = TextEditingController();

  TextEditingController loginEmailCon = TextEditingController();
  TextEditingController loginPasswordCon = TextEditingController();



  TextEditingController resetPassEmailCon = TextEditingController();
  TextEditingController otpCon = TextEditingController();

  TextEditingController newPassCon = TextEditingController();
  TextEditingController confirmNewPassCon = TextEditingController();


  UserModel ? userModel;
  bool isVisiable = true;
  bool isConfirm = true;

  void changePass(){
    isVisiable = ! isVisiable;
    emit(AuthInitial());
  }
  void changeIsConfirm(){
    isConfirm = ! isConfirm;
    emit(AuthInitial());
  }

  void signup({
    required BuildContext context,
    required String name,
    required String image,
    required String gender,
    required int age,
  }){
    emit(AuthLoading());
    DioHelper.postData(
        url: "signup",
        data: {
          "name": name,
          "email": signupEmailCon.text,
          "age":age,
          "phone":"+2${phoneCon.text}",
          "gender":gender,
          "password": passwordCon.text,
          "image":image
        },
    ).then((value) {
      print(value.data);
      print("from Success");
      navigateTo(context: context, widget: LoadingScreen ());
      emit(AuthInitial());
    }).catchError((e){
      print(e);
      emit(AuthInitial());
    });

  }

  void login(BuildContext context){
    emit(AuthLoading());
    DioHelper.postData(
        url: "login",
        data: {
          "email": loginEmailCon.text,
          "password": loginPasswordCon.text,
        },
    ).then((value) async {
      userModel = UserModel.fromJson(value.data);
      await CashHelper.setString(key: "token", value: userModel?.token);
      navigateAndRemove(context: context, widget: HomeScreen());
      emit(AuthInitial());
    }).catchError((e){
      print(e.toString());
      emit(AuthInitial());
    });

  }

  void resetPassEmail(BuildContext context){
    emit(AuthLoading());
    DioHelper.postData(
        url: "request-reset-token",
        data: {
          "email": resetPassEmailCon.text
        },
    ).then((value) {
     print(value.data);
     navigateTo(context: context, widget: const OtpScreen());
    }).catchError((e){
      print(e.toString());
      emit(AuthInitial());
    });

  }

  void verifyOtp(BuildContext context){
    emit(AuthLoading());
    DioHelper.postData(
        url: "verify-reset-token",
        data: {
          "email": resetPassEmailCon.text,
          "token": otpCon.text
        },
    ).then((value) {
     print(value.data);
     navigateTo(context: context, widget: const ResetPasswordScreen());
    }).catchError((e){
      print(e.toString());
      emit(AuthInitial());
    });

  }

  void resetPassword(BuildContext context){
    emit(AuthLoading());
    DioHelper.patchData(
        url: "reset-password",
        data: {
          "email": resetPassEmailCon.text,
          "password": newPassCon.text
        },
    ).then((value) {
     print(value.data);
     navigateAndRemove(context: context, widget: const LoginScreen());
    }).catchError((e){
      print(e.toString());
      emit(AuthInitial());
    });

  }
}
