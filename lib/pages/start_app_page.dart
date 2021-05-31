import 'package:cocos_game/domain/user_domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_page.dart';
import 'home_page.dart';

class StartAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDomain? user = Provider.of<UserDomain?>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? HomePage():AuthPage();
  }
}
