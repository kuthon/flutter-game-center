import 'package:firebase_auth/firebase_auth.dart';

class UserDomain{
  late final String uid;
  late String username;
  late String status;

  UserDomain.fromFirebase(User user){
    this.uid = user.uid;
    this.username = user.email!;
    this.status = 'Hello, world!';
  }

  UserDomain.fromJSON(Object? user){
    if(user is Map<String, dynamic>) {  //always true
      this.uid = user['uid'];
      this.username = user['username'];
      this.status = user['status'];
    }
  }

  @override
  String toString() {
    return 'User(uid: $uid, username: $username, status: $status)';
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'username': username,
      'status': status,
    };
  }
}