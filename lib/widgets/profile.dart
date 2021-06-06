import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/utils/vars.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  final UserDomain user;

  Profile(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                    Container(
                      margin: const EdgeInsets.all(15),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user.avatar)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1, color: Colors.black),
                        color: Colors.white,
                      ),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.username,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            user.status,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
