import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_trek/core/errors/custom_exception.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in  FirebaseAuthService.createUserWithEmailandPassword : ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else {
        throw CustomException(message: 'Error. pls try again later!');
      }
    } catch (e) {
       log(
        'Exception in  FirebaseAuthService.createUserWithEmailandPassword : ${e.toString()} ',
      );
      throw CustomException(message: 'Error. pls try again later!');
    }
  }


  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
       log(
        'Exception in  FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'password or email not vaild');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'password or email not vaild',
        );
      } else  if (e.code == 'invalid-credential'){
        throw CustomException(message: 'password or email not vaild');
      }
      else{
        throw CustomException(message: 'Error. pls try again later!');
      }
    } catch (e) {
       log(
        'Exception in  FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} ',
      );
      throw CustomException(message: 'Error. pls try again later!');
    }
  }


    Future<User> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser == null) {
        throw CustomException(message: 'خطاء في تسجيل دخول بواسطه جوجل');
      }

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
    } catch (e) {
      log(' Exception in  FirebaseAuthService.signInWithGoogle Google Sign-In Error: ${e.toString()}');
      throw CustomException(message: 'خطاء في تسجيل دخول بواسطه جوجل');
    }
  }


}
