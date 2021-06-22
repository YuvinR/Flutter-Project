import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_Service.dart';

class ListOfBuddiesScreen extends StatefulWidget {
  @override
  _ListOfBuddiesScreenState createState() => _ListOfBuddiesScreenState();
}

class _ListOfBuddiesScreenState extends State<ListOfBuddiesScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchfriends();
    });

  }


  Future<dynamic> deleteFriendFromTheList(String friendId) async{

    final response = await http.delete(
      Uri.parse('https://lunbu.herokuapp.com/removeFriendByID/' + friendId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      if (response.body.toString() == 'true') {

        final snackBar = SnackBar(
          content: Text('Friend Has been Deleted'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          fetchfriends();
        });
        
      }else{
        print('Could not complete');
      }
    } else {
      throw Exception('No friend Find');
    }

  }

  Future<List<dynamic>> fetchfriends() async {
    final response = await http.get(
        Uri.parse('https://lunbu.herokuapp.com/getAllFriends'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('No Friend Found');
    }
  }

  String _friendName(dynamic friend) {
    return friend['firstName'] + " " + friend['lastName'];
  }

  String _friendPhone(dynamic friend) {
    return friend['phoneNumber'];
  }

  String _friendId(dynamic friend) {
    return friend['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Buddies",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
       
              child: Container(
                
                child: FutureBuilder<List<dynamic>>(
                  future: fetchfriends(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var frdId = _friendId(snapshot.data[index]);
                            return Card(
                              
                              child: Column(
                                
                                children: <Widget>[
                                  ListTile(
                                      leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage('assets/images/user_Avatar.png')),
                                      title:
                                          Text(_friendName(snapshot.data[index])),
                                      subtitle: Text(
                                          _friendPhone(snapshot.data[index])),
                                      trailing: ElevatedButton(
                                        onPressed: (){
                                          deleteFriendFromTheList(frdId);
                                        },
                                        child: Text('Delete'),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFE73040 )
                                        ),
                                      )),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

