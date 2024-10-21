import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CRUDService {
  // save fcm token to firebase
  static Future saveUserToken(String token) async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> data = {
      'email': user?.email,
      'token': token,
    };
    try {
      await FirebaseFirestore.instance
          .collection('user_data')
          .doc(
            user?.uid,
          )
          .set(data);

      debugPrint("Document Added to ${user?.uid}");
    } catch (e) {
      debugPrint('error in saving to firestore');
      debugPrint(e.toString());
    }
  }
}
