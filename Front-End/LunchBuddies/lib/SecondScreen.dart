import 'package:flutter/material.dart';
import 'package:splash/AboutUsScreen.dart';
import 'package:splash/ListOfBuddiesScreen.dart';
import 'package:splash/LunchBuddies.dart';
import 'package:splash/RestaurantsScreen.dart';
import 'package:splash/UserProfile.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .28,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                UIHeader(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment(-1, 0.35),
                    child: Text(
                      "Home",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: GridView.count(
                  primary: false,
                  // padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      child: Card(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE9ECEF),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Rest()),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                        'assets/images/Resturant_Icon.png'),
                                    height: 78,
                                    width: 78,
                                  ),
                                  Divider(
                                    thickness: 3,
                                    indent: 5,
                                    endIndent: 5,
                                    color: Color(0xFFADB5BD),
                                  ),
                                  Text(
                                    "Restaurants",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF343A40),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE9ECEF),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListOfBuddiesScreen()),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                        'assets/images/Buddies_Icon.png'),
                                    height: 78,
                                    width: 78,
                                  ),
                                  Divider(
                                    thickness: 3,
                                    indent: 5,
                                    endIndent: 5,
                                    color: Color(0xFFADB5BD),
                                  ),
                                  Text(
                                    "Lunch \nBuddies",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF343A40),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ]);
  }
}
