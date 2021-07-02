import 'package:finance_control/controllers/profile_controller.dart';
import 'package:finance_control/controllers/session_controller.dart';
import 'package:finance_control/utils/base_views/base_button.dart';
import 'package:finance_control/utils/base_views/base_text_input.dart';
import 'package:finance_control/utils/base_views/galery_action_sheet.dart';
import 'package:finance_control/utils/base_views/loading.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final ProfileController controller = new ProfileController();
  final SessionController? sessionController = Globals.instance!.sessionController;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    controller.setUser(sessionController?.loggedUser);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Globals.instance!.texts.editProfile), centerTitle: true,),
      backgroundColor: Globals.instance!.theme.backgroundColor,
      body: ListView(children: [
        Observer(builder: (_) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  GestureDetector(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          backgroundImage: controller.image == null ? controller.tempUser?.imageUrl == null ? AssetImage('assets/images/user_placeholder.png') as ImageProvider : NetworkImage(controller.tempUser!.imageUrl!) : FileImage(controller.image!),
                        ),
                      ),
                      onTap: () {
                        final sheet = GaleryActionSheet(actionController: controller.loadImage);
                        showCupertinoModalPopup(context: context, builder: (context) => sheet);
                      }),
                  TextButton(
                      child: Text(Globals.instance!.texts.editProfileImage, style: Globals.instance!.textTheme.caption!.copyWith(color: Globals.instance!.theme.primaryColor)),
                      onPressed: () {
                        final sheet = GaleryActionSheet(actionController: controller.loadImage);
                        showCupertinoModalPopup(context: context, builder: (context) => sheet);
                      }),
                  BaseTextInput(
                    keyboardType: TextInputType.text,
                    hintText: Globals.instance!.texts.name,
                    prefixIcon: Icons.person,
                    onChanged: controller.setName,
                    enabled: !controller.loading,
                    initialValue: controller.tempUser?.name,
                  ),
                  BaseTextInput(
                    keyboardType: TextInputType.emailAddress,
                    hintText: Globals.instance!.texts.email,
                    prefixIcon: Icons.email,
                    onChanged: controller.setEmail,
                    enabled: false,
                    initialValue: controller.tempUser?.email,
                  ),
                  controller.loading
                      ? Loading()
                      : BaseButton(
                      padding: EdgeInsets.only(top: 24, bottom: 8),
                      label: Globals.instance!.texts.save,
                      onPressed: () { controller.updateUser(context).then((value) => _formKey.currentState?.reset()); }),
                ],
              ),
            ),
          );
        })
      ]),
    );
  }
}
