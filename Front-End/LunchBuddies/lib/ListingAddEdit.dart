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

class MidContainer extends State<MidContainerView> {
  TextEditingController dateinput = TextEditingController();
  late List _myActivities;
  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  String _dropDownValue = '07:00AM';

  void initState() {
    super.initState();
    setInitValues();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  var restuarantController = TextEditingController();
  var friendController = TextEditingController();
  var timeDateController = TextEditingController();

  Future setInitValues() async {
    final prefs = await SharedPreferences.getInstance();
    final restname = prefs.getString('restuarant') ?? '';
    restuarantController.text = restname;
  }

  Future updateUserDetails() async {}

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
                          dataSource: [
                            {
                              "display": "Running",
                              "value": "Running",
                            },
                            {
                              "display": "Climbing",
                              "value": "Climbing",
                            },
                            {
                              "display": "Walking",
                              "value": "Walking",
                            },
                            {
                              "display": "Swimming",
                              "value": "Swimming",
                            },
                            {
                              "display": "Soccer Practice",
                              "value": "Soccer Practice",
                            },
                            {
                              "display": "Baseball Practice",
                              "value": "Baseball Practice",
                            },
                            {
                              "display": "Football Practice",
                              "value": "Football Practice",
                            },
                          ],
                          textField: 'display',
                          valueField: 'value',
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
                        padding: EdgeInsets.all(16),
                        child: TextField(
                          controller: dateinput,
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: "Select a Date to Meet Up"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2090));
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateinput.text = formattedDate;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 3,
                        padding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                        child: DropdownButton(
                          hint: _dropDownValue == null
                              ? Text('Dropdown')
                              : Text(
                                  _dropDownValue,
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          items: [
                            '07:00AM',
                            '08:00AM',
                            '09:00AM',
                            '10:00AM',
                            '11:00AM',
                            '12:00PM',
                            '01:00PM',
                            '02:00PM',
                            '03:00PM',
                            '04:00PM',
                            '05:00PM',
                            '06:00PM',
                            '07:00PM',
                            '08:00PM',
                            '09:00PM',
                            '10:00PM'
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _dropDownValue = val.toString();
                              },
                            );
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
                    onPressed: updateUserDetails),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
