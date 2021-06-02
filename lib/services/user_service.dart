import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocos_game/domain/user_domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {

  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('user');

  Future createUser(User user) async {

    Map<String, dynamic> update = {
      'uid': user.uid,
      'username': user.email,
    };

    await _userCollection.doc().set(update);
  }

  Future updateUser(UserDomain user, {String? username}) async {
    Map<String, dynamic> update = user.toMap();

    update['username'] = username ?? update['username'];

    await _userCollection.doc().set(update);
  }

   Future<UserDomain?> getUserById(String uid) async {

    var data = await _userCollection.where("uid", isEqualTo: uid).get();
    var user = data.docs.first.data();
    return UserDomain.fromJSON(user);

  }

}

