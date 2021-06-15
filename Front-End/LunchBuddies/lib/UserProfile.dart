import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileScreen extends StatelessWidget {
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
                    "Profile",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container(
        //     child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     TextFormField(
        //       keyboardType: TextInputType.text,
        //       decoration: InputDecoration(
        //           hintText: 'User Name',
        //           border: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.grey, width: 32.0),
        //               borderRadius: BorderRadius.circular(5.0)),
        //           focusedBorder: OutlineInputBorder(
        //               borderSide: BorderSide(color: Colors.grey, width: 1.0),
        //               borderRadius: BorderRadius.circular(5.0))),
        //       onChanged: (value) {
        //         //Do something with this value
        //       },
        //     ),
        //     TextFormField(),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 16.0),
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         child: const Text('Save'),
        //       ),
        //     ),
        //   ],
        // ))
      ],
    );
  }
}
