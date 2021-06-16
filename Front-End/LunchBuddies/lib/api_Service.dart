import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<bool> validateUser(String usrName, String pwd) async {
    final response = await http.post(
      Uri.parse('localhost:8080/isValidUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'userName': usrName, 'password': pwd}),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('No User Find');
    }
  }
}
