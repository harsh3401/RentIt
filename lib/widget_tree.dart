import 'package:rentofy/auth.dart';
import 'package:rentofy/pages/home.dart';
import 'package:rentofy/pages/login.dart';
import 'package:rentofy/pages/register.dart';
import 'package:rentofy/pages/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:rentofy/pages/register.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return Register();
        }
      },
    );
  }
}
