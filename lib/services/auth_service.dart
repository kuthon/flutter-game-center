import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password ) async {
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }


  Future registerWithEmailAndPassword(String email, String password ) async {
    try{
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  void logOut() async {
    await _fAuth.signOut();
  }

  Future sendPasswordResetEmail({required String email}) async{
    try {
      await _fAuth.sendPasswordResetEmail(email: email);
    }  on FirebaseAuthException  catch (e) {
      print('error: ${e.code}');
      throw e.code;
    }
  }

  Stream<User?> get currentUser {
    return _fAuth.authStateChanges().map((User? user) => user);
  }

}