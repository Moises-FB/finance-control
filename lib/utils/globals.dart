import 'dart:core';
import 'package:finance_control/controllers/session_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Globals {
  static Globals? instance;

  final BuildContext context;

  Globals({ required this.context });

  late final ThemeData theme = Theme.of(context);
  late final TextTheme textTheme = theme.textTheme;
  late final InputDecorationTheme inputTheme = theme.inputDecorationTheme;
  late final Size windowSize = MediaQuery.of(context).size;
  late final AppLocalizations texts = AppLocalizations.of(context)!;
  late final SessionController sessionController = Provider.of<SessionController>(context, listen: false);
}