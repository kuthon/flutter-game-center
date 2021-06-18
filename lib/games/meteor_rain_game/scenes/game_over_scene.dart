import 'package:cocos_game/games/common_vars/game_common_vars.dart';
import 'package:cocos_game/games/core/app_scene.dart';
import '../entities/game_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'game_scene.dart';

class GameOverScene extends AppScene {
  void _startNewGame() {
    GameCommonVars.currentScene = GameScene();
    GameCommonVars.isPause = false;
  }

  void _continueGame() async {
   GameCommonVars.rewardedAd!.fullScreenContentCallback =
        FullScreenContentCallback(
          onAdShowedFullScreenContent: (RewardedAd ad) =>
              print('$ad onAdShowedFullScreenContent.'),
          onAdDismissedFullScreenContent: (RewardedAd ad) {
            print('$ad onAdDismissedFullScreenContent.');
            ad.dispose();
          },
          onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
            print('$ad onAdFailedToShowFullScreenContent: $error');
            ad.dispose();
          },
          onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
        );
    if (GameCommonVars.rewardedAd != null && GameCommonVars.adIsShowed == false) {
      await GameCommonVars.rewardedAd!.show(
          onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
            GameCommonVars.isPause = false;
            GameBar.lives = 3;
            GameCommonVars.currentScene = GameCommonVars.previousScene;
            GameCommonVars.adIsShowed = true;
          });
    }
  }

  @override
  void update() {}

  @override
  Widget buildScene() {
    return SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Game over!',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Your Score: ${GameBar.score}',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RawMaterialButton(
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.subdirectory_arrow_left,
                              size: 20,
                            ),
                          ),
                          TextSpan(
                              text: ' Play again',
                              style:
                              TextStyle(color: Colors.black, fontSize: 20)),
                        ]),
                      ),
                      onPressed: () {
                        _startNewGame();
                      },
                    ),
                    if (GameCommonVars.rewardedAd != null &&
                        GameCommonVars.adIsShowed == false)
                      Divider(
                        color: Colors.grey,
                      ),
                    if (GameCommonVars.rewardedAd != null &&
                        GameCommonVars.adIsShowed == false)
                      RawMaterialButton(
                        child: RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.ondemand_video,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                                text: ' Continue',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ]),
                        ),
                        onPressed: () {
                          _continueGame();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
