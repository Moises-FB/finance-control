import 'package:finance_control/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class GaleryActionSheet extends StatelessWidget {

  final Function({bool remove, ImageSource? source}) actionController;
  const GaleryActionSheet({required void Function({bool remove, ImageSource? source}) this.actionController});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text("Selecione uma fonte", style: Globals.instance!.theme.textTheme.subtitle1),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Galeria", style: Globals.instance!.theme.textTheme.bodyText1),
          onPressed: () {
            Navigator.pop(context);
            actionController(source : ImageSource.gallery);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Câmera", style: Globals.instance!.theme.textTheme.bodyText1),
          onPressed: () {
            actionController(source : ImageSource.camera);
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Remover", style: Globals.instance!.theme.textTheme.bodyText1),
          isDestructiveAction: true,
          onPressed: () {
            actionController(source : null, remove : true);
            Navigator.pop(context);
          },
        ),

      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
