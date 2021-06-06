import 'package:cocos_game/domain/message_domain.dart';
import 'package:cocos_game/services/chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:cocos_game/services/auth_service.dart';
import 'package:cocos_game/utils/vars.dart';


void precache(BuildContext context) async{
  precacheUserDomain = await AuthService().onceUser;
  if (precacheUserDomain != null) {
    await precacheImage(NetworkImage(precacheUserDomain!.avatar), context);
  }

  List<MessageDomain> _chat = await ChatService().onceChat();
  for (MessageDomain _message in _chat)
    await precacheImage(NetworkImage(_message.avatar), context);
}