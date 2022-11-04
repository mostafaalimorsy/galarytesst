import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galarytesst/controller/authCubit/cubit.dart';
import 'package:galarytesst/controller/authCubit/states.dart';
import 'package:galarytesst/controller/galaryCubit/cubit.dart';
import 'package:galarytesst/controller/helper/bloc_observe.dart';
import 'package:galarytesst/controller/helper/dio_helper.dart';
import 'package:galarytesst/view/screens/login.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (BuildContext context) =>LoginCubit(),),
        BlocProvider(create: (BuildContext context) =>GalleryCubit()..getImageData(),),
      ],
      child: BlocConsumer<LoginCubit,LoginStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, LoginStates state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
        );
      },
    ),
    );
  }
}

