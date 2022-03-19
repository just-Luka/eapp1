import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  void login() async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'lukachots@gmail.com',
        password: '123456789',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void run() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently singout');
      } else {
        print('User is sign in');
      }
    });
  }
}
