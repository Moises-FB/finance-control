import 'package:finance_control/pages/add_new_page.dart';
import 'package:finance_control/pages/edit_profile_page.dart';
import 'package:finance_control/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:finance_control/pages/login_page.dart';
import 'package:finance_control/pages/sign_up_page.dart';
import 'package:finance_control/utils/globals.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/session_controller.dart';

void main() {
  runApp(FinanceControl());
}

class FinanceControl extends StatelessWidget {
  static final GlobalKey<NavigatorState> mainState = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    Firebase.initializeApp();

    return Provider(
      create: (_) => SessionController(),
      child: MaterialApp(
        navigatorKey: mainState,
        debugShowCheckedModeBanner: false,
        title: 'Finance Control',
        localizationsDelegates: [
          AppLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('pt', 'BR'),
        ],
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Color.fromRGBO(255, 196, 0, 1),
          accentColor: Color.fromRGBO(61, 1, 78, 1),
          primarySwatch: Colors.amber,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Color.fromRGBO(255, 196, 0, 1))),
              hoverColor: Color.fromRGBO(255, 196, 0, 1),
              alignLabelWithHint: true,
              hintStyle: TextStyle(color: Colors.grey, textBaseline: TextBaseline.alphabetic, fontWeight: FontWeight.normal),
              labelStyle: TextStyle(color: Colors.black, textBaseline: TextBaseline.alphabetic, fontWeight: FontWeight.normal),
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.grey)),
              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.red))),
          textTheme: TextTheme(
            headline4: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            button: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
            bodyText1: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),
            subtitle1: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
            overline: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
            caption: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.normal),
          ),
        ),
        darkTheme: ThemeData(
          backgroundColor: Colors.grey.shade900,
          primaryColor: Color.fromRGBO(255, 196, 0, 1),
          accentColor: Color.fromRGBO(61, 1, 78, 1),
          primarySwatch: Colors.amber,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade900,
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Color.fromRGBO(255, 196, 0, 1))),
              hoverColor: Color.fromRGBO(255, 196, 0, 1),
              alignLabelWithHint: true,
              hintStyle: TextStyle(color: Colors.white, textBaseline: TextBaseline.alphabetic, fontWeight: FontWeight.normal),
              labelStyle: TextStyle(color: Colors.white, textBaseline: TextBaseline.alphabetic, fontWeight: FontWeight.normal),
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.white)),
              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32), borderSide: BorderSide(color: Colors.red))),
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
            bodyText1: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal),
            subtitle1: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
            overline: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
            caption: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal),
          ),
        ),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) {
            Globals.instance = Globals(context: FinanceControl.mainState.currentContext!);
            return LoginPage();
          },
          '/login': (context) => LoginPage(),
          '/signUp': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/addNew': (context) => AddNewPage(),
          '/profile': (context) => EditProfilePage(),
        },
      ),
    );
  }
}
