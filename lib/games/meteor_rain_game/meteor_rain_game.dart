import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cocos_game/games/common_vars/game_common_vars.dart';
import 'package:cocos_game/games/core/game.dart';
import 'package:cocos_game/pages/start_app_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'scenes/game_scene.dart';

class MeteorRainGame extends StatefulWidget {


  @override
  _MeteorRainGameState createState() => _MeteorRainGameState();
}

class _MeteorRainGameState extends State<MeteorRainGame> with WidgetsBindingObserver {
  final AudioCache _cache = AudioCache(prefix: 'assets/games/audio/');
  final AudioPlayer _player = AudioPlayer(playerId: 'background');
  late final String _url;

  Future<void> loadAudio() async {
    _url = (await _cache.load('background.mp3')).path;
    await _player.setUrl(_url);
    await _player.setReleaseMode(ReleaseMode.STOP);
  }

  void startAudio() async {
    await _player.resume();
    _player.onPlayerCompletion.listen((_) {
      _player.resume();
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    GameCommonVars.screenHeight = MediaQuery.of(context).size.height;
    GameCommonVars.screenWidth = MediaQuery.of(context).size.width;
    GameCommonVars.isPause = false;
    GameCommonVars.adIsShowed = false;
    GameCommonVars.currentScene = GameScene();
    GameCommonVars.previousScene = GameScene();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _player.dispose();
    _cache.clearAll();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      _player.pause();
    } else {
      _player.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Future(() async {
      await loadAudio();
    }), builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.ballClipRotateMultiple,
                  color: Theme.of(context).accentColor,
                )),
          ),
        );
      } else {
        startAudio();
        return CupertinoApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              body: AudioServiceWidget(
                child: WillPopScope(
                  onWillPop: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => StartAppPage(),
                        ),
                            (route) => false);
                    return Future.value(false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/games/images/background.png'),
                            fit: BoxFit.cover)),
                    child: Game(),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
