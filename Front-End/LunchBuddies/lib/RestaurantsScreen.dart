import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//Creating a class user to store the data;
class User {
  final String restaurantName;
  final String rate;
  final String location;
  final String phoneNumber;
  final String restaurantId;

  User(
      {required this.restaurantName,
      required this.rate,
      required this.location,
      required this.phoneNumber,
      required this.restaurantId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      restaurantName: json['restaurantName'],
      rate: json['rate'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      restaurantId: json['restaurantId'],
    );
  }

}

Future<List<User>> getRequest() async {
 
  final response = await http.get(
      Uri.parse('https://lunbu.herokuapp.com/getAllRestaurants'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    print(response.toString());
  } else {
    throw Exception('Unexpected error occured!');
  }


  var responseData = json.decode(response.body);


  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((data) => new User.fromJson(data)).toList();


}

class Rest extends StatefulWidget {
  @override
  RestaurantsScreen createState() => RestaurantsScreen();
}

class RestaurantsScreen extends State<Rest> {
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
                    "Restaurants",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width,
          child: ItemView(),
        )
      ],
    );
  }
}



class ItemView extends StatefulWidget {
  @override
  BodyLayout createState() => BodyLayout();
}

class BodyLayout extends State<ItemView> {
  late Future<List<User>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return _myListView(context, futureData);
  }
}

Widget _myListView(BuildContext context, Future<List<User>> newData) {
  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk
  ];

  return FutureBuilder<List<User>>(
    future: newData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<User>? data = snapshot.data;
        return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text(data[index].restaurantName),
                  trailing: Icon(Icons.keyboard_arrow_right)
                ),
              );
            });
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      return Container(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              height: 10.0,
              width: 10.0,
            )
          ],
        ),
      ));
    },
  );
}
