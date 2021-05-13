// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "account_of_such_data_does_not_exist" : MessageLookupByLibrary.simpleMessage("Account of such data does not exist"),
    "already_registered" : MessageLookupByLibrary.simpleMessage("Already registered?"),
    "auth" : MessageLookupByLibrary.simpleMessage("Authorization"),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "email_is_incorrect" : MessageLookupByLibrary.simpleMessage("Email is incorrect"),
    "fill_in_all_the_required_data" : MessageLookupByLibrary.simpleMessage("Fill in all the required data"),
    "forgot_your_password" : MessageLookupByLibrary.simpleMessage("Forgot your password?"),
    "invalid_password" : MessageLookupByLibrary.simpleMessage("Invalid password"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "not_registered_yet" : MessageLookupByLibrary.simpleMessage("Not registered yet?"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "password_is_too_short" : MessageLookupByLibrary.simpleMessage("Password is too short"),
    "register" : MessageLookupByLibrary.simpleMessage("Register"),
    "registration" : MessageLookupByLibrary.simpleMessage("Registration"),
    "user_agreement" : MessageLookupByLibrary.simpleMessage("I have read the privacy policy and am ready to receive advertising information")
  };
}
