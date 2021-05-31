import 'package:firebase_auth/firebase_auth.dart';

class UserDomain{
  late final String uid;
  late String username;

  UserDomain.fromFirebase(User user){
    this.uid = user.uid;
    this.username = user.email!;
  }

}