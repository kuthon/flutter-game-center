import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/widgets/show_toast.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  final BuildContext context;
  final String error;
  late String msg;
  ErrorHandler({required this.error, required this.context}) {
    switch (error) {
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
      case 'email-already-in-use':
        msg = S.of(context).user_with_such_data_already_exists;
        break;
      default:
        msg = error;
    }
    print('ErrorHandler: $error -> $msg');
  }

  void showErrorMessage(){
    showToast(msg);
  }


  String getErrorMessage(BuildContext context) {
    return msg;
  }

}
