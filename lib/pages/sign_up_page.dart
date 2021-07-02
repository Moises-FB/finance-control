import 'package:finance_control/controllers/sign_up_controller.dart';
import 'package:finance_control/utils/base_views/base_button.dart';
import 'package:finance_control/utils/base_views/base_text_input.dart';
import 'package:finance_control/utils/base_views/galery_action_sheet.dart';
import 'package:finance_control/utils/base_views/loading.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController controller = new SignUpController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(Globals.instance!.texts.signUpText, style: Globals.instance!.textTheme.headline6, textAlign: TextAlign.justify),
                  ),

                  GestureDetector(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          backgroundImage: controller.image == null ? AssetImage('assets/images/user_placeholder.png') as ImageProvider : FileImage(controller.image!),
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
                    keyboardType: TextInputType.emailAddress,
                    hintText: Globals.instance!.texts.name,
                    prefixIcon: Icons.person,
                    onChanged: controller.setName,
                    enabled: !controller.loading,
                  ),
                  BaseTextInput(
                    keyboardType: TextInputType.emailAddress,
                    hintText: Globals.instance!.texts.email,
                    prefixIcon: Icons.email,
                    onChanged: controller.setEmail,
                    enabled: !controller.loading,
                  ),
                  BaseTextInput(
                    hintText: Globals.instance!.texts.password,
                    obscureText: !controller.visible,
                    prefixIcon: Icons.vpn_key,
                    suffixIcon: IconButton(
                      icon: Icon(controller.iconVisibility),
                      onPressed: controller.toggleVisibility,
                      color: Colors.grey,
                    ),
                    onChanged: controller.setPassword,
                    enabled: !controller.loading,
                    done: true,
                  ),
                  controller.loading
                      ? Loading()
                      : BaseButton(
                          padding: EdgeInsets.only(top: 24, bottom: 8),
                          label: Globals.instance!.texts.register,
                          onPressed: controller.registerPressed ? () => controller.signUp(context).then((_) => _formKey.currentState?.reset()) : null),
                  Center(
                    child: GestureDetector(
                        child: Text(Globals.instance!.texts.alreadyHaveAccount, textAlign: TextAlign.center, style: Globals.instance!.textTheme.caption),
                        onTap: () => Navigator.pop(context)),
                  )
                ],
              ),
            ),
          );
        })
      ]),
    );
  }
}
