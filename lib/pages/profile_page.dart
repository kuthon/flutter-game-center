import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/services/db_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {

  late UserDomain user;

  @override
  Widget build(BuildContext context) {

    user = Provider.of<UserDomain?>(context)!;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('${user.uid}'),
          Text('${user.username}'),
          Text('${user.status}'),
          TextButton(
              onPressed: () async {
                String? url = await DbStorageService.uploadImageFrom(
                    source: ImageSource.gallery
                );
                print('url: $url');
             },
              child: Text('upload'),
          )
        ]
      )
    );
  }
}
