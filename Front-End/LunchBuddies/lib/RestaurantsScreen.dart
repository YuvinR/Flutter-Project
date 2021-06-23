import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:splash/ListingAddEdit.dart';
import 'package:splash/Models/Restuarant.dart';
import 'package:shared_preferences/shared_preferences.dart';
//Creating a class Restuarant to store the data;


Future<List<Restuarant>> getRequest() async {
 
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
  return jsonResponse.map((data) => new Restuarant.fromJson(data)).toList();


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
  late Future<List<Restuarant>> futureData;
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

Future navigateToAddEdit(BuildContext context,Restuarant obj) async {

  final prefs = await SharedPreferences.getInstance();
    prefs.setString('restuarant',obj.restaurantName );
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateRoom(),
                              settings: RouteSettings(
                              arguments: obj,
                            ),
                          ),
                             
                        );
}

Widget _myListView(BuildContext context, Future<List<Restuarant>> newData) {

  return FutureBuilder<List<Restuarant>>(
    future: newData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Restuarant>? data = snapshot.data;
        return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: (){
                      navigateToAddEdit(context,data[index]);
                  },
                  leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/dish.png'),
     
      ),
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
