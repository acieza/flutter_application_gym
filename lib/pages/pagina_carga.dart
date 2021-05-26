import 'dart:async';
import 'package:flutter/material.dart';

import 'login.dart';

class PaginaCarga extends StatefulWidget {
  @override
  _PaginaCargaState createState() => _PaginaCargaState();
}

class _PaginaCargaState extends State<PaginaCarga> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff0984e3), Color(0xff74b9ff)],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/icons/logo_small_icon_only.png"),
        ),
      ),
    );
  }
}
