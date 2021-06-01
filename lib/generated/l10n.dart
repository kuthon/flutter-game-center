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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
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

  /// `An account recovery instruction has been sent to the specified mail`
  String get sent_account_recovery_instruction {
    return Intl.message(
      'An account recovery instruction has been sent to the specified mail',
      name: 'sent_account_recovery_instruction',
      desc: '',
      args: [],
    );
  }

  /// `A user with such data already exists`
  String get user_with_such_data_already_exists {
    return Intl.message(
      'A user with such data already exists',
      name: 'user_with_such_data_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Global сhat`
  String get global_chat {
    return Intl.message(
      'Global сhat',
      name: 'global_chat',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Games`
  String get games {
    return Intl.message(
      'Games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet`
  String get no_messages_yet {
    return Intl.message(
      'No messages yet',
      name: 'no_messages_yet',
      desc: '',
      args: [],
    );
  }

  /// `Your message...`
  String get your_message {
    return Intl.message(
      'Your message...',
      name: 'your_message',
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
