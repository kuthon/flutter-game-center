import 'package:cocos_game/domain/message_domain.dart';
import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/services/user_service.dart';
import 'package:cocos_game/widgets/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final MessageDomain message;
  final bool fromMe;

  Message(this.message, {this.fromMe = false});

  void _showProfile({required MessageDomain message, required BuildContext context}) async {
    UserDomain? _user = await UserService().getUserById(message.uid);
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(0),
            children: <Widget>[
              Profile(_user!),
            ],
          );
          },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!fromMe) Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(message.avatar),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(Radius.circular(25)),
              border: Border.all(width: 1, color: Colors.black),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {_showProfile(message: message, context: context);},
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
                constraints: BoxConstraints(
                  minHeight: 60,
                  maxWidth: 320
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: fromMe
                      ? Colors.amber.withOpacity(0.15)
                      : Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${message.username}',
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 18),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${message.text}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      softWrap: true,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
