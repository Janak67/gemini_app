import 'package:advance_exam/utils/import.dart';

class FireHelper {
  static FireHelper fireHelper = FireHelper._();

  FireHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  Future<String> createAccount(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return "Failed";
    }
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return "Failed";
    }
  }

  bool checkUser() {
    user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<void> loginGuest() async {
    try {
      await firebaseAuth.signInAnonymously();
      print('Temporary Account');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print('Anonymous auth hasn`t been enabled for this project.');
          break;
        default:
          print('Unknown error.');
      }
    }
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
