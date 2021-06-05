import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocos_game/domain/user_domain.dart';

class MessageDomain {
  late final String uid;
  late final String text;
  late final String username;
  late final Timestamp date;
  late final String avatar;


  MessageDomain({required this.text, required UserDomain author, Timestamp? date}){
    this.uid = author.uid;
    this.username = author.username;
    this.avatar = author.avatar;
    this.date = date ?? Timestamp.now();
  }

  MessageDomain.fromJSON(Object? message){
    if(message is Map<String, dynamic>) {  //always true
      this.uid = message['uid'];
      this.text = message['text'];
      this.username = message['username'];
      this.date = message['date'];
      this.avatar = message['avatar'];
    }
  }


  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'text': text,
      'username': username,
      'date': date,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    return '$MessageDomain(uid: $uid, text: $text, username: $username, date: $date, avatar: $avatar)';
  }

}