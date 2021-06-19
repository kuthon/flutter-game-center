import 'package:cocos_game/games/meteor_rain_game/meteor_rain_game.dart';
import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/widgets/game_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GridView.count(
        padding: const EdgeInsets.all(5),
        crossAxisCount: 3,
        children: <Widget>[
          GameIconButton(
              image: Image.asset('assets/games/images/meteor_rain_icon.png'),
              name: S.of(context).meteor_rain,
              materialPageRoute: MaterialPageRoute(
                builder: (BuildContext context) => MeteorRainGame(),
              ),
              isReplacement: true,
          ),
        ],
      ),
    );
  }
}
