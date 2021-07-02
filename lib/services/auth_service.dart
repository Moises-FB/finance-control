import 'package:finance_control/services/upload_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_control/models/user.dart' as UserModel;

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel.User>(
        fromFirestore: (snapshot, _) => UserModel.User.fromJson(snapshot),
        toFirestore: (user, _) => user.toJson()
  );

  Future<UserModel.User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email,password: password);
      if (userCredential.user?.uid == null) return null;
      UserModel.User myUser =  await _usersRef.doc(userCredential.user!.uid).get().then((snapshot) => snapshot.data() as UserModel.User);
      return myUser;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }

  }

  Future<UserModel.User?> signUp(UserModel.User user, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email!, password: password);
      if (userCredential.user?.uid == null) return null;
      user.uid = userCredential.user?.uid;
      if(user.image != null) {
        UploadService uploader = new UploadService();
        user.imageUrl = await uploader.uploadProfilePicture(user.image!, userCredential.user!.uid);
      }
      await _usersRef.doc(userCredential.user!.uid).set(user);
      return user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw e;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<UserModel.User?> loadUserData() async {
    try {
      if (_auth.currentUser?.uid != null) {
        UserModel.User myUser =  await _usersRef.doc(_auth.currentUser!.uid).get().then((snapshot) => snapshot.data() as UserModel.User);
        return myUser;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}