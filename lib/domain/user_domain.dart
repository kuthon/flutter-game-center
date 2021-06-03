import 'package:firebase_auth/firebase_auth.dart';

class UserDomain{
  late final String uid;
  late String username;
  late String status;
  late String avatar;

  UserDomain.fromFirebase(User user){
    this.uid = user.uid;
    this.username = user.email!;
    this.status = 'Hello, world!';
    this.avatar = 'https://firebasestorage.googleapis.com/v0/b/cocos-game-dfd74.appspot.com/o/service%2Favatar.jpg?alt=media&token=4502b0c8-4e4e-45ce-b8fb-89dbab0c5bf1';
  }

  UserDomain.fromJSON(Object? user){
    if(user is Map<String, dynamic>) {  //always true
      this.uid = user['uid'];
      this.username = user['username'];
      this.status = user['status'];
      this.avatar = user['avatar'];
    }
  }

  @override
  String toString() {
    return 'User(uid: $uid, username: $username, status: $status, avatar: $avatar)';
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'username': username,
      'status': status,
      'avatar': avatar,
    };
  }
}