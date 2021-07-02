import 'package:flutter/material.dart';

import '../globals.dart';

class BaseButton extends StatelessWidget {
  final String label;
  final  Function()? onPressed;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  BaseButton(
      {required this.label,
        required this.onPressed,
        this.padding,
        this.height,
        this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 8),
      child: Container(
        height: height ?? 50,
        width: width ?? Globals.instance!.windowSize.width * 0.6,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: onPressed != null
                ? Globals.instance!.theme.primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: SizedBox.expand(
          child: TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  label,
                    style: Globals.instance!.textTheme.button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}