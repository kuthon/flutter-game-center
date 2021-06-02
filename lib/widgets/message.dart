import 'package:cocos_game/domain/message_domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final MessageDomain message;
  final bool fromMe;

  Message(this.message, {this.fromMe = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        //image
        Flexible(
          fit: FlexFit.loose,
          child: Container(
              constraints: BoxConstraints(
                maxWidth: 320
              ),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
    );
  }
}
