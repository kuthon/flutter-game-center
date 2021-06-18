import 'package:cocos_game/games/core/app_scene.dart';
import 'package:cocos_game/games/meteor_rain_game/scenes/game_scene.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameCommonVars {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static AppScene currentScene = GameScene();
  static AppScene previousScene = GameScene();
  static bool isPause = false;
  static RewardedAd? rewardedAd;
  static bool adIsShowed = false;
}