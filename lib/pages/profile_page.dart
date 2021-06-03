import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {

  late UserDomain user;


  @override
  Widget build(BuildContext context) {

    user = Provider.of<UserDomain?>(context)!;

    return Profile(user);
  }
}
