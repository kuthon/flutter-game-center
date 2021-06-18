import 'package:audioplayers/audioplayers.dart';
import 'package:cocos_game/games/common_vars/game_common_vars.dart';
import 'package:cocos_game/games/core/app_scene.dart';
import '../entities/game_bar.dart';
import '../entities/meteor.dart';
import '../entities/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'game_over_scene.dart';

class GameScene extends AppScene {
  GameScene() {
    GameCommonVars.adIsShowed = false;
    RewardedAd.load(
        adUnitId: RewardedAd.testAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback:
        RewardedAdLoadCallback(onAdLoaded: (RewardedAd ad) {
          print('$ad loaded.');
          GameCommonVars.rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
        }));
  }

  AudioCache _audioCache = AudioCache(
      prefix: "assets/games/audio/",
      fixedPlayer: AudioPlayer(
        mode: PlayerMode.MEDIA_PLAYER,
      )..setReleaseMode(ReleaseMode.STOP))
    ..loadAll(['gameover.mp3', 'fail.mp3']);

  Player _player = Player();
  List<Meteor> _meteors = [
    Meteor(y: GameCommonVars.screenHeight * 1.1),
    Meteor(y: GameCommonVars.screenHeight * 1.3),
    Meteor(y: GameCommonVars.screenHeight * 1.5),
    Meteor(y: GameCommonVars.screenHeight * 1.7),
  ];
  GameBar _gameBar = GameBar();

  @override
  Widget buildScene() {
    return Stack(
      children: [
        for (Meteor meteor in _meteors) meteor.build(),
        _player.build(),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: GameCommonVars.screenHeight - 80,
              width: GameCommonVars.screenWidth,
              child: GestureDetector(
                onPanStart: (details) => _onPan(details),
                onPanUpdate: (details) => _onPan(details),
              ),
            )),
        _gameBar.build(),
      ],
    );
  }

  void _onPan(details) {
    if (GameCommonVars.isPause == false) {
      double fromPositionX = _player.x + _player.width / 2;
      double toPositionX = details.globalPosition.dx;
      _player.dx = (toPositionX - fromPositionX);
    }
  }

  @override
  void update() {
    _player.update();
    _gameBar.update();

    for (Meteor _meteor in _meteors) {
      _meteor.update();

      //meteor hit check
      if (_meteor.x > _player.x &&
          _meteor.x < (_player.x + _player.width) &&
          _meteor.y < (_player.y + _player.height) &&
          _meteor.y > _player.y) {
        _meteor.reInit();
        fail();
      } else if ((_meteor.x + _meteor.width) > _player.x &&
          (_meteor.x + _meteor.width) < (_player.x + _player.width) &&
          _meteor.y < (_player.y + _player.height) &&
          _meteor.y > _player.y) {
        _meteor.reInit();
        fail();
      }
    }
  }

  void fail() {
    GameBar.lives--;
    if (GameBar.lives == 0) {
      _audioCache.play('gameover.mp3');
      print('GAME OVER');
      GameCommonVars.isPause = true;
      GameCommonVars.previousScene = this;
      GameCommonVars.currentScene = GameOverScene();
      for (Meteor _meteor in _meteors) _meteor.y += GameCommonVars.screenHeight;
    } else {
      _audioCache.play('fail.mp3');
    }
  }
}
