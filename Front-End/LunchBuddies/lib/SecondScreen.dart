import 'package:flutter/material.dart';
import 'package:splash/AboutUsScreen.dart';
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
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GridView.count(
              primary: false,
              // padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.restaurant),
                    label: Text(
                      "Resturant",
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantsScreen()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.group_sharp),
                    label: Text(
                      "Lunch \nBuddies",
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LunchBuddiesScreen()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.edit),
                    label: Text(
                      "Profile",
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.restaurant),
                    label: Text(
                      "About Us",
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUsScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
