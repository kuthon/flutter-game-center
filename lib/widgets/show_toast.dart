import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast (String msg) {
  print('showToast: $msg');
  Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.black,
  );
}