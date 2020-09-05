import 'package:eduthon/pages/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class courses extends StatelessWidget with NavigationStates {
  Container myArticles(String imageVal)
  {
    return Container(
      width: 100,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(0.0),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageVal)
            ),
          ),
          child: FlatButton(onPressed: () async{
  }
    ),
    ),
      ),
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 250, 1),
      body: SingleChildScrollView(
      child : SafeArea(
      child : Column(
      children: <Widget>[
        Image.asset("assets/bg1.png"),
        SizedBox(
          height: 10,
        ),
        Text(
          "My Courses",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color.fromRGBO(126, 46, 132, 1),
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            RoundedButton(
              text: "Subject 1        -        8.2 / 10",
              textColor: Colors.white,
              press: (){},
            ),
            RoundedButton(
              text: "Subject 2        -        4.2 / 10",
              textColor: Colors.white,
              press: (){},
            ),
            RoundedButton(
              text: "Subject 3        -        7.8 / 10",
              textColor: Colors.white,
              press: (){},
            ),
            ],
            ),

          ],
        ),
      ),
      ),
    );
  }
}
