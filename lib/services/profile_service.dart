

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_control/controllers/session_controller.dart';
import 'package:finance_control/models/user.dart';
import 'package:finance_control/services/upload_service.dart';
import 'package:finance_control/utils/globals.dart';

class ProfileService {

  final CollectionReference _usersRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<User>(
      fromFirestore: (snapshot, _) => User.fromJson(snapshot),
      toFirestore: (user, _) => user.toJson()
  );

  Future<void> updateUser(User user) async {

    try {
      SessionController sessionController = Globals.instance!.sessionController;

      if (sessionController.loggedUser?.uid == null) return null;
      if(user.image != null) {
        UploadService uploader = new UploadService();
        user.imageUrl = await uploader.uploadProfilePicture(user.image!, sessionController.loggedUser!.uid!);
      }
      await _usersRef.doc(sessionController.loggedUser!.uid!).set(user);
      sessionController.setUser(user);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}