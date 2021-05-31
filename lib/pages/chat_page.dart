import 'package:cocos_game/domain/message_domain.dart';
import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/services/db_service.dart';
import 'package:cocos_game/widgets/input_text_field.dart';
import 'package:cocos_game/widgets/message.dart';
import 'package:flutter/material.dart';
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
  

  Future<void> loadData() async{
    var stream = db.getGlobalChatHistory();
    stream.listen((List<MessageDomain> chatHistory) {
      if (mounted)
        setState(() {
          _chatHistory = chatHistory;
          print('LOAD DATA: \n$_chatHistory\n');
        });

    });
  }

  @override
  Widget build(BuildContext context) {

    user = Provider.of<UserDomain?>(context)!;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: ((_chatHistory ?? []).isNotEmpty) ? Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true,
              physics: ClampingScrollPhysics(),
              itemCount: _chatHistory!.length,
              itemBuilder: (context, i){
                return Container(
                  child: Message(_chatHistory![i]),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(child: InputTextField(
                textEditingController: _textEditingController,
                hint: 'Your message...',
              )),
              IconButton(
                  onPressed: () {
                    db.sendMessageToGlobalChat(
                        MessageDomain(
                            text: _textEditingController.text.trim(),
                            author: user
                        )
                    );
                    _textEditingController.clear();
                    _scrollController.jumpTo(0);
                  }, 
                  icon: Icon(
                    Icons.send, 
                    size: 30, 
                    color: Theme.of(context).accentColor,
                  )
              ),
            ],
          ),
        ],
      )
          :
          Center(
              child: TextButton(
                child: Text('SEND'),
                onPressed: () => db.sendMessageToGlobalChat(MessageDomain(text: 'text', author: user)),
              ) 
          ),
    );
  }
}
