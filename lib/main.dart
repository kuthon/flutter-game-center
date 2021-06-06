import 'package:cocos_game/pages/splash_page.dart';
import 'package:cocos_game/pages/start_app_page.dart';
import 'package:cocos_game/precache/precache.dart';
import 'package:cocos_game/services/auth_service.dart';
import 'package:cocos_game/themes/theme.dart';
import 'package:cocos_game/utils/vars.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'domain/user_domain.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future( () => precache(context)),
        //Future.microtask(() => precache())
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: SplashPage(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return StreamProvider<UserDomain?>.value(
              initialData: precacheUserDomain,
              value: AuthService().streamUser,
              child: MaterialApp(
                theme: theme,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                home: StartAppPage(),
              ),
            );
          }
        });
  }
}

