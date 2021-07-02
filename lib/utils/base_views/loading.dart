import 'package:flutter/material.dart';

import '../globals.dart';

class Loading extends StatelessWidget {
  final Color? color;

  Loading({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Globals.instance!.windowSize.height * 0.15,
      child: Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(color ?? Globals.instance!.theme.primaryColor),),
      ),
    );
  }
}