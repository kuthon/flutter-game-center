import 'package:cocos_game/domain/message_domain.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final MessageDomain message;

  Message(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${message.username}:',
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '${message.text}',
                          overflow: TextOverflow.fade,
                          maxLines: 5,
                          softWrap: true,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20
                          ),
                        )
                      ],
                    ),
          ),
        ),
      ],
    );
  }
}
