import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class User extends Object {

  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  File? image;

  User({ this.uid, this.name, this.email, this.imageUrl });

  User.fromJson(DocumentSnapshot<Object?> snapshot)
      : this(
      uid : snapshot.id,
      name : (snapshot.data()! as Map<String, Object?>)['name'] as String,
      email : (snapshot.data()! as Map<String, Object?>)['email'] as String,
      imageUrl : (snapshot.data()! as Map<String, Object?>)['imageUrl'] as String?
  );

 Map<String, Object?> toJson() {
   return {
     'name': name,
     'email': email,
     'imageUrl': imageUrl
   };
 }
}