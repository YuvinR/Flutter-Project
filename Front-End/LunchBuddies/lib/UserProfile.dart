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
  var loginUsrId;
  var loginUsrName;
  var loginUsrPassword;
  var loginUsrPhone;

  Future getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final userNameInLogin = prefs.getString('usrName') ?? '';

    final response = await http.get(
      Uri.parse(
          'https://lunbu.herokuapp.com/userByUserName/' + userNameInLogin),
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
