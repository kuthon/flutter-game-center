import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/services/auth_service.dart';

late final UserDomain? precacheUserDomain;

void precache() async{
  precacheUserDomain = await AuthService().onceUser;
}