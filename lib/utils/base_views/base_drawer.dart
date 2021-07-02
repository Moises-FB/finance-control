import 'package:finance_control/controllers/session_controller.dart';
import 'package:finance_control/utils/globals.dart';
import "package:flutter/material.dart";

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SessionController controller = Globals.instance!.sessionController;
    return Drawer(
      child: Material(
        color: Globals.instance!.theme.primaryColor,
        child: ListView(
          children: [
            SizedBox(height: 10),
            buildMenuHeader(imgUrl: controller.loggedUser?.imageUrl, email: controller.loggedUser?.email ?? "-", name: controller.loggedUser?.name ?? "-", onClicked: () => { Navigator.of(context).pushNamed('/profile') }),
            SizedBox(height: 30),
            buildMenuItem(text: Globals.instance!.texts.drawer_home, icon: Icons.home, onClicked: () => { Navigator.of(context).pop() }),
            SizedBox(height: 18),
            buildMenuItem(text: Globals.instance!.texts.drawer_addNew, icon: Icons.add, onClicked: () => { Navigator.of(context).pushNamed('/addNew') }),
            SizedBox(height: 20),
            Divider(color: Colors.white70),
            SizedBox(height: 20),
            buildMenuItem(text: Globals.instance!.texts.drawer_logout, icon: Icons.exit_to_app, onClicked: () => { Globals.instance!.sessionController.logout(context) })
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
    return ListTile(leading: Icon(icon, color: Colors.white), title: Text(text, style: Globals.instance!.textTheme.bodyText1!.copyWith(color: Colors.white)), hoverColor: Colors.white70, onTap: onClicked,);
  }

  Widget buildMenuHeader({String? imgUrl, required String email, required String name, VoidCallback? onClicked}) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: imgUrl == null ? AssetImage("assets/images/user_placeholder.png")  as ImageProvider : NetworkImage(imgUrl), radius: 30),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                Text(email, style: TextStyle(color: Colors.white))
              ],
            )
          ],
        ),
      ),
    );
  }
}
