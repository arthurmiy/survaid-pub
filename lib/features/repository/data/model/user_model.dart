import 'package:capimobile/features/repository/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    String name,
    String email,
    String uid,
    String imageUrl,
  }) : super(
          name,
          email,
          uid,
          imageUrl,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        imageUrl: json['imageUrl'],
        email: json['email'],
        uid: json['uid']);
  }
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      name: documentSnapshot.data()['name'],
      uid: documentSnapshot.data()['uid'],
      email: documentSnapshot.data()['email'],
      imageUrl: documentSnapshot.data()['imageUrl'],
    );
  }

  factory UserModel.fromUserObj(User user) {
    if (user != null) {
      return UserModel(
        name: user.displayName,
        uid: user.uid,
        email: user.email,
        imageUrl: user.photoURL,
      );
    } else {
      return UserModel(
        name: null,
        uid: null,
        email: null,
        imageUrl: null,
      );
    }
  }
  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "uid": uid,
      "email": email,
      "imageUrl": imageUrl,
    };
  }
}
