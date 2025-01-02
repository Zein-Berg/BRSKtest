import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    String? photoURL,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<bool> isLoggedIn();

  Future<void> signOut();
}

class RemoteDataSourceImp implements RemoteDataSource {
  //final firebase_auth.FirebaseAuth firebaseAuth;

  //RemoteDataSourceImp({required this.firebaseAuth});

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw Exception('Exception: user credential is null');
      }
      return UserModel.fromFirebase(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception('Sign in exception: $e');
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    String? photoURL,
  }) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Exception: user credential is null');
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'name': name,
        'photoURL': photoURL,
      });
      return UserModel.fromFirebase(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception('Sign up exception: $e');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception('Sign out exception: $e');
    }
  }
}
