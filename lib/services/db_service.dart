import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocos_game/domain/message_domain.dart';

class DatabaseService {
  final CollectionReference _chatCollection = FirebaseFirestore.instance.collection('chat');

  Future sendMessageToGlobalChat(MessageDomain message) async {
    await _chatCollection.doc().set(message.toMap());
  }

  Stream<List<MessageDomain>> getGlobalChatHistory() {
    return _chatCollection.orderBy('date', descending: true).limitToLast(30).snapshots()
        .map((QuerySnapshot data) => data.docs
          .map((QueryDocumentSnapshot doc) =>
            MessageDomain.fromJSON(doc.data())).toList());
  }

}
