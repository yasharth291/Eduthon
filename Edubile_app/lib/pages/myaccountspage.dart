import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:eduthon/pages/Info_card.dart';

const email = 'XXXX@example.com';
const phone = '+91 XXX XXXX XXX';
const url = "Indian Institute of Information technology Dharwad";


class MyAccountsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              child: Image.asset("assets/student.png"),
            ),
            Text(
              'ABC',
              style: TextStyle(
                fontSize: 40.0,
                color:  Color.fromRGBO(126, 46, 132, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '19XXX21',
              style: TextStyle(
                fontSize: 30.0,
                color:  Color.fromRGBO(126, 46, 132, 1),
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color:Color.fromRGBO(230, 230, 250, 1),
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
              onPressed: () {},
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
              onPressed: () {},
            ),
            InfoCard(
              text: url,
              icon: Icons.web,
              onPressed: () {},
            ),
            InfoCard(
              text: 'Mathura, India',
              icon: Icons.location_city,
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(230, 230, 250, 1),
    );
  }
}
