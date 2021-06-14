import 'package:flutter/material.dart';

class UIHeader extends StatefulWidget {
  @override
  _UIHeaderState createState() => _UIHeaderState();
}

class _UIHeaderState extends State<UIHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Header_2.png')
                )
              ),
        )
      ]),
    );
  }
}
