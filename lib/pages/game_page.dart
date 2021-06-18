import 'package:cocos_game/games/meteor_rain_game/meteor_rain_game.dart';
import 'package:cocos_game/generated/l10n.dart';
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MeteorRainGame(),
                    ),
                    (route) => false);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                      child: Image.asset('assets/games/images/meteor_rain_icon.png')),
                  Text(
                    '${S.of(context).meteor_rain}',
                    style: Theme.of(context).textTheme.headline5,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
