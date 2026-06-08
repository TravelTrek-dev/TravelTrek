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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in  FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'password or email not vaild');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'password or email not vaild');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'password or email not vaild');
      } else {
        throw CustomException(message: 'Error. pls try again later!');
      }
    } catch (e) {
      log(
        'Exception in  FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} ',
      );
      throw CustomException(message: 'Error. pls try again later!');
    }
  }

  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw CustomException(message: 'Please sign in again.');
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.changePassword: ${e.toString()} and code is ${e.code}');
      if (e.code == 'wrong-password') {
        throw CustomException(message: 'The current password is incorrect.');
      } else if (e.code == 'weak-password') {
        throw CustomException(message: 'The new password is too weak.');
      } else if (e.code == 'requires-recent-login') {
        throw CustomException(message: 'Please sign in again before changing your password.');
      } else {
        throw CustomException(message: 'Error. pls try again later!');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.changePassword: ${e.toString()}');
      throw CustomException(message: 'Error. pls try again later!');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final googleUser = await googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(
        credential,
      )).user!;
    } catch (e) {
      log(
        ' Exception in  FirebaseAuthService.signInWithGoogle Google Sign-In Error: ${e.toString()}',
      );
      throw CustomException(message: 'خطاء في تسجيل دخول بواسطه جوجل');
    }
  }
}
