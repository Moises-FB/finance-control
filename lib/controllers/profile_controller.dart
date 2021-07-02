import 'dart:io';

import 'package:finance_control/models/user.dart';
import 'package:finance_control/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileController with _$ProfileController;

abstract class _ProfileController with Store {

  @observable
  User? tempUser;

  @observable
  File? image;

  @observable
  bool loading = false;

  @action
  void setUser(User? user) => tempUser = user;

  @action
  void setName(String value) => tempUser?.name = value;

  @action
  void setEmail(String value) => tempUser?.email = value;

  @action
  Future<void> loadImage({ImageSource? source, bool remove = false}) async {
    loading = true;
    if (source == null || remove) {
      image = null;
    } else {
      await ImagePicker().getImage(source: source).then((file) {
        if (file != null) {
          image = File(file.path);
        } else {
          image = null;
        }
        setImage(image);
        loading = false;
      });
    }
  }

  @action
  void setImage(File? file) => tempUser?.image = image;

  @action
  Future<void> updateUser(BuildContext context) async {
    ProfileService service = ProfileService();
    if (tempUser != null) {
      loading = true;
      await service.updateUser(tempUser!).then((_) {
        loading = false;
      });
    }

  }
}