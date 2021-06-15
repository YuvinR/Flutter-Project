import 'package:flutter/material.dart';
import 'UIHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatelessWidget {
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
                padding: const EdgeInsets.only(left:10 ),
                child: Align(
                  alignment: Alignment(-1,0.2),
                  child: Text(
                    "About Us",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
 
  }
}
