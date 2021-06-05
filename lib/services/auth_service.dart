import 'package:cocos_game/domain/user_domain.dart';
import 'package:cocos_game/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password ) async {
    try{
      await _fAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }


  Future registerWithEmailAndPassword(String email, String password ) async {
    try{
      var _userCredential = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      var _user = _userCredential.user;
      if (_user != null)
        await UserService().createUser(_user);
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
      throw e.code;
    }
  }

  Stream<UserDomain?> get streamUser {
      return _fAuth.authStateChanges().asyncMap((User? user) async {
        if (user != null) {
            UserDomain? _userDomain = await UserService().getUserById(user.uid);
            print('$_userDomain');
            return _userDomain;
          }
          return null;
      });
  }

  Future<UserDomain?> get onceUser {
    return _fAuth.authStateChanges().first.then((data) async{
      if (data != null) {
        UserDomain? _userDomain = await UserService().getUserById(data.uid);
        print('$_userDomain');
        return _userDomain;
      }
    });
  }
}
