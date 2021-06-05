import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocos_game/domain/message_domain.dart';

class ChatService {
  final CollectionReference _chatCollection = FirebaseFirestore.instance.collection('chat');

  Future sendMessage(MessageDomain message) async {
    await _chatCollection.doc().set(message.toMap());
  }

  Stream<List<MessageDomain>> streamChat() {
    return _chatCollection.orderBy('date', descending: true).limit(30).snapshots()
        .map((QuerySnapshot data) => data.docs
          .map((QueryDocumentSnapshot doc) =>
            MessageDomain.fromJSON(doc.data())).toList());
  }

  Future<List<MessageDomain>> onceChat() async{
    return await _chatCollection.orderBy('date', descending: true).limit(30).snapshots()
        .map((value) => MessageDomain.fromJSON(value.docs.first.data())).toList();
  }

}
