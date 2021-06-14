import 'package:flutter/material.dart';

import 'SecondScreen.dart';

class UIHeader extends StatefulWidget {
  @override
  _UIHeaderState createState() => _UIHeaderState();
}

class _UIHeaderState extends State<UIHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/Header_2.png'),
          ),
        ),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Row(children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(Icons.home_filled, color: Colors.black)),
              ]),
            )
          ]),
        ),
      ),
    ]);
  }
}
