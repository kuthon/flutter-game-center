import 'package:cocos_game/services/auth_service.dart';
import 'package:cocos_game/widgets/show_toast.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('PRIVET'),

                TextButton(
                    onPressed: () => AuthService().logOut(),
                    child: Text('log out')
                ),
              ],
            ),
          ),
        )
    );
  }
}
