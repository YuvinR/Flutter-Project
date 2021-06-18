import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_Service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future validateUser() async {
    final response = await http.post(
      Uri.parse('https://lunbu.herokuapp.com/isValidUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': nameController.value.text,
        'password': passwordController.value.text
      }),
    );

    if (response.statusCode == 200) {
      if (response.body.toString() == 'true') {
        // print("USer validated");
        // print("Getting the Response Body");
        // print(response.body);
        final snackBar = SnackBar(
          content: Text('Record Has Been Updated'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondScreen()),
        );
        return response.body;
      }else{
        final snackBar = SnackBar(
          content: Text('Invalid Credentials. Try again.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      throw Exception('No User Find');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 100,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF08D25),
                          ),
                          onPressed: validateUser

                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}