// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Authorization`
  String get auth {
    return Intl.message(
      'Authorization',
      name: 'auth',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `I have read the privacy policy and am ready to receive advertising information`
  String get user_agreement {
    return Intl.message(
      'I have read the privacy policy and am ready to receive advertising information',
      name: 'user_agreement',
      desc: '',
      args: [],
    );
  }

  /// `Not registered yet?`
  String get not_registered_yet {
    return Intl.message(
      'Not registered yet?',
      name: 'not_registered_yet',
      desc: '',
      args: [],
    );
  }

  /// `Already registered?`
  String get already_registered {
    return Intl.message(
      'Already registered?',
      name: 'already_registered',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot_your_password {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Email is incorrect`
  String get email_is_incorrect {
    return Intl.message(
      'Email is incorrect',
      name: 'email_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Fill in all the required data`
  String get fill_in_all_the_required_data {
    return Intl.message(
      'Fill in all the required data',
      name: 'fill_in_all_the_required_data',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get password_is_too_short {
    return Intl.message(
      'Password is too short',
      name: 'password_is_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Account of such data does not exist`
  String get account_of_such_data_does_not_exist {
    return Intl.message(
      'Account of such data does not exist',
      name: 'account_of_such_data_does_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get invalid_password {
    return Intl.message(
      'Invalid password',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}