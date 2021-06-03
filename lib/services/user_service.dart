import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocos_game/domain/user_domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {

  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('user');

  Future<void> createUser(User user) async {

    Map<String, dynamic> newUser = UserDomain.fromFirebase(user).toMap();

    await _userCollection.doc().set(newUser);
  }

  Future<void> updateUser({required UserDomain user}) async {
    Map<String, dynamic> updateUser = user.toMap();

    await _userCollection.doc().set(updateUser);
  }

   Future<UserDomain?> getUserById(String uid) async {

    var data = await _userCollection.where("uid", isEqualTo: uid).get();
    var user = data.docs.first.data();
    return UserDomain.fromJSON(user);

  }

}

