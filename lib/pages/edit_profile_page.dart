import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/services/db_storage_service.dart';
import 'package:cocos_game/services/user_service.dart';
import 'package:cocos_game/widgets/custom_text_button.dart';
import 'package:cocos_game/widgets/input_text_field.dart';
import 'package:cocos_game/widgets/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController _usernameEditingController =
      TextEditingController();
  final TextEditingController _statusEditingController =
      TextEditingController();
  late final UserDomain user;

  EditProfilePage({required this.user});

  void save(BuildContext context) async {
    if (_usernameEditingController.text.trim().isNotEmpty) {
      user.username = _usernameEditingController.text.trim();
      _usernameEditingController.clear();
    }
    if (_statusEditingController.text.trim().isNotEmpty) {
      user.status = _statusEditingController.text.trim();
      _statusEditingController.clear();
    }
    await showLoading(context: context, function: () => UserService().updateUser(user: user));
    Navigator.pop(context);
  }

  void _saveImage(BuildContext context) {
    showLoading(context: context, function: () =>  DbStorageService.uploadImage(source: ImageSource.gallery)
        .then((String? url) {
      if (url != null) {
        user.avatar = url;
        UserService().updateUser(user: user);
        Navigator.pop(context);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: () => save(context), icon: Icon(Icons.check)),
        ],
        title: Text(S.of(context).editing),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${S.of(context).username}',
                style: TextStyle(
                    fontSize: 21,
                    color: Theme.of(context).textTheme.headline1!.color)),
            InputTextField(
              textEditingController: _usernameEditingController,
              hint: user.username,
            ),
            SizedBox(
              height: 20,
            ),
            Text('${S.of(context).status}',
                style: TextStyle(
                    fontSize: 21,
                    color: Theme.of(context).textTheme.headline1!.color)),
            InputTextField(
              textEditingController: _statusEditingController,
              hint: user.status,
            ),
            SizedBox(
              height: 20,
            ),
            Text('${S.of(context).avatar}',
                style: TextStyle(
                    fontSize: 21,
                    color: Theme.of(context).textTheme.headline1!.color)),
            CustomTextButton(
                onTap: () => _saveImage(context),
                title: '${S.of(context).upload}')
          ],
        ),
      ),
    );
  }
}
