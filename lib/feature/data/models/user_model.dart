import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.name,
    super.avatarImage,
  });

  factory UserModel.fromFirebase(firebase_auth.User firebaseUser) {
    return UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName,
      avatarImage: firebaseUser.photoURL,
    );
  }
}
