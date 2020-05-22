import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_blood/app/modules/login/models/user_model.dart';
import 'package:my_blood/app/shared/helpers/firebase_errors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Firestore _firestore = Firestore.instance;

  Future<FirebaseUser> signInWithCredentials(
      {String email, String password}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on PlatformException catch (e) {
      if (firebaseErrors.containsKey(e.code))
        return Future.error(firebaseErrors[e.code]);
      else
        return Future.error('Ocorreu um erro indefinido.');
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<FirebaseUser> createUserWithEmailAndPassword(
      {String email, String password, String name}) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await createUserData(user: result.user, name: name);

      return result.user;
    } on PlatformException catch (e) {
      if (firebaseErrors.containsKey(e.code))
        return Future.error(firebaseErrors[e.code]);
      else
        return Future.error('Ocorreu um erro indefinido.');
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future createUserData({FirebaseUser user, String name}) async {
    final userModel = UserModel(
      uid: user.uid,
      name: name,
      email: user.email,
      picture: user.photoUrl,
    );

    return _firestore
        .collection('users')
        .document(user.uid)
        .setData(userModel.toMap());
  }

  Future<void> sendPasswordResetEmail({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on PlatformException catch (e) {
      if (firebaseErrors.containsKey(e.code))
        return Future.error(firebaseErrors[e.code]);
      else
        return Future.error('Ocorreu um erro indefinido.');
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }
}
