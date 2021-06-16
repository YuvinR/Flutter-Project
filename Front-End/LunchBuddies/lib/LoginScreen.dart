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

  Future<bool> validateUser() async {
    final response = await http.post(
      Uri.parse('localhost:8080/isValidUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': nameController.value.text,
        'password': passwordController.value.text
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('No User Find');
    }
  }

  // final ApiService api = ApiService();

  // Future userLoginMethod(){
  //   Future<bool> returnedValue = api.validateUser(nameController.value.text, passwordController.value.text);

  //   return returnedValue;
  //   // throw Exception('No User FInd');

  // }

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
                        onPressed: () {
                          // if (validateUser() == true) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SecondScreen()),
                          //   );
                          // }
                          // );
                          if (passwordController.value.text == "abcd" &&
                              nameController.value.text == 'abcd') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen()),
                            );
                          }
                        },
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
