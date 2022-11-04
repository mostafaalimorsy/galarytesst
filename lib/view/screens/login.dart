import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galarytesst/controller/authCubit/cubit.dart';
import 'package:galarytesst/controller/authCubit/states.dart';
import 'package:galarytesst/controller/service/componans.dart';
import 'package:galarytesst/view/screens/galary.dart';
import 'package:galarytesst/view/widget/custom/authBUtton.dart';
import 'package:galarytesst/view/widget/custom/textFormField.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwdcontroller = TextEditingController();
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (BuildContext context, LoginStates state) {
        if(state is ScuccessStates) navigatReplace(context,GalaryScreen());

      },
      builder: (BuildContext context, LoginStates state) {
        LoginCubit getData=LoginCubit.get(context);
        return Scaffold(
          body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/log in.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.black54),
                      ),
                      Text(
                        "Gelary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: height / 2.2,
                        width: width / 1.2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          color: Colors.white.withOpacity(.4),
                          elevation: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Text(
                                "LOG IN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: defaultTextForm(
                                  controller: emailcontroller,
                                    icon: Icons.email_outlined,
                                    msg: 'please enter your e-mail',
                                    type: TextInputType.emailAddress,
                                    labelText: "User Name", hintText: "User Name"),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: defaultTextForm(
                                    msg: 'please enter your password',
                                    type: TextInputType.visiblePassword,
                                     controller: passwdcontroller,
                                    icon: Icons.lock,
                                    passwd: true,
                                    onTap: () {
                                      getData.changPasswordVisiability();
                                    },
                                    visableIcon: getData.suffix,
                                    labelText: "Password", hintText: "Password"),
                              ),
                              Spacer(),
                              Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: ConditionalBuilder(
                                    condition: state is! LoadingStates,
                                    builder: (BuildContext context) {
                                      return authButton(
                                          onpressed: (){
                                            if(formKey.currentState!.validate())
                                            {
                                              getData.postLogin(
                                                email: emailcontroller.text,
                                                password: passwdcontroller.text,
                                              );
                                              print(emailcontroller.text);
                                              print(passwdcontroller.text);
                                            }
                                          },

                                          context: context,
                                          authButtonText: "SUBMITT");
                                  }, fallback: (BuildContext context) {
                                      return Center(child: CircularProgressIndicator());
                                  },

                                  )),
                              Spacer(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
        );
      },
    );
  }
}
