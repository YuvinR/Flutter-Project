import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              child:
                  Image(image: AssetImage('assets/images/LoginUI_Screen.png')),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Lunch Buddies',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('assets/images/LunchBuddies.png'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        //controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen()),
                            );
                          },
                        )),
                  ],
                ))
            //     child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     TextFormField(
            //       keyboardType: TextInputType.text,
            //       decoration: InputDecoration(
            //           hintText: 'User Name',
            //           border: OutlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey, width: 32.0),
            //               borderRadius: BorderRadius.circular(5.0)),
            //           focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(color: Colors.grey, width: 1.0),
            //               borderRadius: BorderRadius.circular(5.0))),
            //       onChanged: (value) {
            //         //Do something with this value
            //       },
            //     ),
            //     TextFormField(),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 16.0),
            //       child: ElevatedButton(
            //         onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => SecondScreen()),
            //               );
            //         },
            //         child: const Text('Login'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
