import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     new UIHeader(),
    //     Padding(
    //       padding: EdgeInsets.all(16.0),
    //     ),
    //   ],
    // );
    return Scaffold(
        body: Stack(children: <Widget>[
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
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Row(children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.home_filled),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen()),
                        );
                      },
                    ),
                  ),
                ]),
              ),
              //This card is only used for testing purposes
              // Card(
              //     color: Colors.orange,
              //     child: Center(
              //       child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: <Widget>[
              //             Text('Test Data'),
              //           ]),
              //     )),
            ],
          ),
        ),
      ),
    ]));
  }
}
