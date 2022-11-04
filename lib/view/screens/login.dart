import 'package:flutter/material.dart';
import 'package:galarytesst/controller/service/componans.dart';
import 'package:galarytesst/view/screens/galary.dart';
import 'package:galarytesst/view/widget/custom/authBUtton.dart';
import 'package:galarytesst/view/widget/custom/textFormField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
        Column(
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
                          labelText: "User Name", hintText: "User Name"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultTextForm(
                        passwd: true,
                          labelText: "Password", hintText: "Password"),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width/1.4,
                        child: authButton(
                          onpressed: (){
                            navigatReplace(context,GalaryScreen());
                          },

                            context: context,
                            authButtonText: "SUBMITT")),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
