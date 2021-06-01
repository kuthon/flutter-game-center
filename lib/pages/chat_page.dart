import 'package:cocos_game/domain/message_domain.dart';
import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/generated/l10n.dart';
import 'package:cocos_game/services/db_service.dart';
import 'package:cocos_game/widgets/input_text_field.dart';
import 'package:cocos_game/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late UserDomain user;
  DatabaseService db = DatabaseService();
  List<MessageDomain>? _chatHistory;
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var stream = db.getGlobalChatHistory();
    stream.listen((List<MessageDomain> chatHistory) {
      if (mounted)
        setState(() {
          _chatHistory = chatHistory;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserDomain?>(context)!;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: (_chatHistory != null)
          ? Column(
              children: [
                Expanded(
                  child: (_chatHistory!.isNotEmpty)
                      ? ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: _chatHistory!.length,
                          itemBuilder: (context, i) {
                            return Container(
                              child: Message(
                                _chatHistory![i],
                                fromMe: user.uid == _chatHistory![i].uid,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                          '${S.of(context).no_messages_yet}',
                          style: Theme.of(context).textTheme.headline3,
                        )),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InputTextField(
                      textEditingController: _textEditingController,
                      hint: '${S.of(context).your_message}',
                    )),
                    IconButton(
                        onPressed: () {
                          db.sendMessageToGlobalChat(MessageDomain(
                              text: _textEditingController.text.trim(),
                              author: user));
                          _textEditingController.clear();
                          _scrollController.jumpTo(0);
                        },
                        icon: Icon(
                          Icons.send,
                          size: 30,
                          color: Theme.of(context).accentColor,
                        )),
                  ],
                ),
              ],
            )
          : Center(
              child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              color: Theme.of(context).accentColor,
            )),
    );
  }
}
