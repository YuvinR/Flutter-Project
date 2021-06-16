import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                        "Profile",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage('assets/images/user_Avatar.png')
                ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
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
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 100,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF08D25),
                    ),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Record Has Been Updated'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
