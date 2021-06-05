import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_page.dart';
import 'home_page.dart';

class StartAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDomain? user = Provider.of<UserDomain?>(context);
    final bool isLoggedIn = user != null;

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: SplashPage(), debugShowCheckedModeBanner: false,);
        } else {
          return isLoggedIn ? HomePage() : AuthPage();
        }
      },
    );
  }
}

