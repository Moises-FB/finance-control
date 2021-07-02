import 'package:flutter/material.dart';

class BasePrefixIcon extends StatelessWidget {
  final IconData iconData;
  final EdgeInsets? padding;
  final Color? color;

  BasePrefixIcon({required this.iconData, this.padding, this.color});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: padding ?? EdgeInsets.all(0),
        child: Icon(iconData,
          color: color ?? Colors.grey,
        )
    );
  }
}