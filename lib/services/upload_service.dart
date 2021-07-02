import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadService {
  Future<String?> uploadProfilePicture(File file, String uid) async {
    try {
      await FirebaseStorage.instance.ref('$uid/profile_image').putFile(file);
      String downloadURL = await FirebaseStorage.instance.ref('$uid/profile_image').getDownloadURL();
      return downloadURL;
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
