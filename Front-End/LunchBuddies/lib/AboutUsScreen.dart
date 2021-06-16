import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  UIHeader(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment(-1, 0.5),
                      child: Text(
                        "About Us",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10,20,10,10),
              child: Text(
                'Little Bit About Us',
                style: TextStyle(
                    fontSize: 35,
                    color: Color(0xFFF08D25),
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20,30,20,10),
              
              child: Text(
                'We TEAM BRAVO introducing this App So that any user in this app is able to connect with their loved ones on a Restaurant which they prefer most. Take a brake from your work & Enjoy your Time with the Loved Ones ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
                
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10,20,10,10),
              child: Text(
                'Thank you!',
                style: TextStyle(
                  
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
                
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10,0,10,20),
              child: Text(
                'Team Bravo',
                style: TextStyle(
                  
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey
                ),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
