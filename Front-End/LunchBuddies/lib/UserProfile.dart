import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phonenumberController = TextEditingController();
  var loginUsrId ;
  var loginUsrName;
  var loginUsrPassword;
  var loginUsrPhone;

  Future getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final userNameInLogin = prefs.getString('usrName') ?? '';

    final response = await http.get(
      Uri.parse('https://lunbu.herokuapp.com/userByUserName/' + userNameInLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
    );

    print(response.body.toString());

    var userDet = json.decode(response.body);
    loginUsrName = userDet['userName'];
    loginUsrPassword = userDet['password'];
    loginUsrPhone = userDet['phoneNumber'];
    loginUsrId = userDet['userID'];


    if (response.statusCode == 200) {
      nameController.text = loginUsrName;
      passwordController.text = loginUsrPassword;
      phonenumberController.text = loginUsrPhone;
    } else {
      throw Exception('No User Find');
    }
  }

  Future updateUserDetails() async{

    final response = await http.post(
      Uri.parse('https://lunbu.herokuapp.com/newUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName' :loginUsrName,
        'password': passwordController.value.text,
        'phoneNumber' :phonenumberController.value.text,
        'userID':loginUsrId
      }),
      
    );

    var userUpdDet = json.decode(response.body);
    
    if (response.statusCode == 200) {
      if (userUpdDet != null) {
        print('Updated');
        final snackBar = SnackBar(
          content: Text('Profile Has been updated'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        print('Could not complete');
      }
    } else {
      throw Exception('No User Find');
    }

  }

  @override
    void initState() {
      super.initState();
      setState(() {
        getUserDetails();
      });
    }
  
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
                
                controller: phonenumberController,
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
                    onPressed: updateUserDetails
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
