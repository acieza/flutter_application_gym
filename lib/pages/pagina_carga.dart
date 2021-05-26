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
              colors: [Colors.white, Colors.blue[300]],
              end: Alignment.bottomLeft,
              begin: Alignment.topRight),
        ),
        child: Center(
          child: Image.asset(
            "assets/icons/logo_large.png",
            width: 170,
          ),
        ),
      ),
    );
  }
}
