import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  FirebaseAuthException error;

  Future<User> signInWithEmailAndPassword(String email, String password ) async {
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      error = e;
      print('\nsignInWithEmailAndPassword error: ${e.code}\n');
    }

    return null;
  }


  Future<User> registerWithEmailAndPassword(String email, String password ) async {
    try{
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      error = e;
      print('\nregisterWithEmailAndPassword error: ${e.code}\n');
    }
    return null;
  }

  Future<void> logOut() async {
    await _fAuth.signOut();
  }

  Future<void> sendPasswordResetEmail({String email}) async{
    try {
      _fAuth.sendPasswordResetEmail(email: email);
    }catch(e){
      error = e;
      print('sendPasswordResetEmail: ${e.code}');
    }
  }

  Stream<User> get currentUser {
    return _fAuth.authStateChanges().map((User user) => user);
  }

}