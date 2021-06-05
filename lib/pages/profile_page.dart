import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/pages/edit_profile_page.dart';
import 'package:cocos_game/services/auth_service.dart';
import 'package:cocos_game/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserDomain user;


  @override
  void didChangeDependencies() {
    user = Provider.of<UserDomain?>(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Profile(user),
        TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EditProfilePage(user: user))
              );
              },
            child: Text(
                S.of(context).edit,
              style: Theme.of(context).textTheme.headline4,
            )
        ),
        Container(
          child: TextButton(
              onPressed: (){
                AuthService().logOut();
              },
              child: Text(
                S.of(context).exit,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18
                ),
              )
          ),
        )

      ],
    );
  }
}
