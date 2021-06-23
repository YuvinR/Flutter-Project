import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:splash/Models/Restuarant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class CreateRoom extends StatefulWidget {
  @override
  AddEditView createState() => AddEditView();
}

class AddEditView extends State<CreateRoom> {
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
                    "Create Session",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
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
          child: MidContainerView(),
        )
      ],
    );
  }

}



class MidContainerView extends StatefulWidget {
  @override
  MidContainer createState() => MidContainer();
}


class MidContainer extends  State<MidContainerView> {

  var  dataArray  = [];
   final format = DateFormat("yyyy-MM-dd HH:mm");
late List _myActivities;
  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

 void initState() {
    super.initState();
   setInitValues();
   fetchfriends().then((value) =>setDataArray(value));
    _myActivities = [];
    _myActivitiesResult = '';
  }

  var restuarantController = TextEditingController();
  var friendController = TextEditingController();
  var timeDateController = TextEditingController();

  setDataArray(value){
    dataArray =value;
  }

 Future setInitValues() async{
    final prefs = await SharedPreferences.getInstance();
    final restname = prefs.getString('restuarant') ?? '';
    restuarantController.text = restname;

  }

  Future updateUserDetails() async{
  final snackBar = SnackBar(
          content: Text('Lunch Buddies Session Created '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<List<dynamic>> fetchfriends() async {
    final response = await http.get(
        Uri.parse('https://lunbu.herokuapp.com/getAllFriends'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      dataArray = json.decode(response.body);
      print(dataArray);
      return json.decode(response.body);
      
    } else {
      throw Exception('No Friend Found');
    }
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }


  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
           

            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: restuarantController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Restuarant',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: MultiSelectFormField(
                  autovalidate: false,
                  title: Text('Friends'),
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                  },
                  dataSource:[ {
                      "firstName": "Kamal",
                      "lastname": "Running",
                    },
                   {
                      "firstName": "Nimsara",
                      "lastname": "Running",
                    },
                    {
                      "firstName": "Sanduni",
                      "lastname": "Running",
                    },
                     {
                      "firstName": "Susil",
                      "lastname": "Running",
                    },
                     {
                      "firstName": "Kavindya",
                      "lastname": "Running",
                    },
                    ],
                  textField: 'firstName',
                  valueField: 'firstName',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                 
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),     
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivitiesResult),
              )
            ],
          ),
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