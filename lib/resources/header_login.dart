import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  String text;

  HeaderLogin({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/pexels-burst-374101.jpg")),
        color: Colors.black,
        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Positioned(
              top: 35,
              left: 20,
              child: Image.asset(
                "assets/icons/logo_large.png",
                width: 80,
              )),
        ],
      ),
    );
  }
}
