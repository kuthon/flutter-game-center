import 'package:firebase_auth/firebase_auth.dart';

class UserDomain{
  late final String uid;
  late String username;

  UserDomain.fromFirebase(User user){
    this.uid = user.uid;
    this.username = user.email!;
  }

  UserDomain.fromJSON(Object? user){
    if(user is Map<String, dynamic>) {  //always true
      this.uid = user['uid'];
      this.username = user['username'];
    }
  }

  @override
  String toString() {
    return 'User(uid: $uid, username: $username)';
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'username': username,
    };
  }
}