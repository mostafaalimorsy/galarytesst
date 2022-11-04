import 'package:flutter/material.dart';


Widget authButton ({ required BuildContext context,  authButtonText ,VoidCallback? onpressed})=>  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.blue,
    child: TextButton(
      onPressed: onpressed,
      child: Text("${authButtonText}",style: TextStyle(color: Colors.white),),
    ));