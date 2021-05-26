import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_page.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);
    final bool isLoggedIn = user != null;
    print(user);
    return isLoggedIn ? HomePage():AuthPage();
  }
}
