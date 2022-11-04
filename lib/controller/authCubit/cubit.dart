import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galarytesst/controller/authCubit/states.dart';
import 'package:galarytesst/controller/helper/dio_helper.dart';
import 'package:galarytesst/controller/service/constant.dart';
import 'package:galarytesst/model/end_point.dart';
import 'package:galarytesst/model/login.dart';



class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(IntialLoginStates ());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? PostLogin ;
  IconData suffix = Icons.visibility_outlined ;
  bool password = true;


  void postLogin({required String email , required String password })  {
    emit(LoadingStates());
    DioHelper?.postDataAPI(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value){
      emit(ScuccessStates(LoginModel.fromjson(value.data)));
      PostLogin = LoginModel.fromjson(value.data);
      token = LoginModel.fromjson(value.data).token!;

    }).catchError((error){
      emit(ErrorStates(error.toString()));
      print(error.toString());
    });

  }

  //To change Password Visiability
  void changPasswordVisiability( ){
    password = !password;
    suffix = password ?  Icons.visibility_outlined : Icons.visibility_off_outlined   ;
    emit(ChangPasswordVisabilityStates());


  }



}

