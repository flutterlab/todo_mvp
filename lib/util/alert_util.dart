import 'package:flutter/material.dart';

class AlertUtil{

  static void  showSnackBar(BuildContext context, String message){
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}