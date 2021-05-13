import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/widgets/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  final BuildContext context;
  final FirebaseAuthException error;
  String msg;
  ErrorHandler({this.error, this.context}) {
    switch (error.code) {
      case 'invalid-email':
        msg = S.of(context).email_is_incorrect;
        break;
      case 'unknown':
        msg = S.of(context).fill_in_all_the_required_data;
        break;
      case 'weak-password':
        msg = S.of(context).password_is_too_short;
        break;
      case 'user-not-found':
        msg = S.of(context).account_of_such_data_does_not_exist;
        break;
      case 'wrong-password':
        msg = S.of(context).invalid_password;
        break;
      default:
        msg = error.code;
    }
  }

  void showErrorMessage(){
    showToast(msg);
  }


  String getErrorMessage(BuildContext context) {
    return msg;
  }

}
