import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_Service.dart';

class InviteBuddiesScreen extends StatefulWidget {
  @override
  _InviteBuddiesScreenState createState() => _InviteBuddiesScreenState();
}

class _InviteBuddiesScreenState extends State<InviteBuddiesScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                UIHeader(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment(-1, 0.2),
                    child: Text(
                      "Buddies",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width,
            
          )
          
          // Container(

          // )
        ],
      ),
    );
  }

  Widget friendCard(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Image(image: AssetImage('assets/images/user_Avatar.png')),
          Column(
            children: <Widget>[
              Text("Name of the Buddie"),
              Text("Phone Number of the Buddie")
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Invite'),
            style: ElevatedButton.styleFrom(),
          )
        ],
      ),
    );
  }
}
