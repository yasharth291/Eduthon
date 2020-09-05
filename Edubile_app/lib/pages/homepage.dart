import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}
class home extends StatefulWidget {
  @override
  home_State createState() => home_State();
}

class home_State extends State<home> {
  static int id1 = 1;
  static int id2 = 2;
  static int id3 = 3;
  static int id4 = 4;
  static int id5 = 5;
  static int id6 = 6;
  static int id7 = 7;
  static int id8 = 8;
  Widget clipOvalImage(String imageVal,String id)
  {
    return ClipOval(
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
    );
  }
  Container myArticles(String imageVal)
  {
    return Container(
      width: 100,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.asset(imageVal),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 250, 1),
      body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                      Container(
                        height: 140,
                        child: Image.asset("assets/logo.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height:200,
                        child: Carousel(
                          boxFit: BoxFit.fitHeight,
                          images:[
                            AssetImage('assets/file/LEFT2.png'),
                            AssetImage('assets/file/MID.png')
                          ],
                          autoplay: true,
                          autoplayDuration: Duration(milliseconds: 3000),
                          showIndicator: false,
                          animationDuration: Duration(milliseconds: 2000),
                          borderRadius: true,
                        ),
                      ),
                SizedBox(
                  height: 40,
                ),
               Container(
                 child: Row(
                   children: <Widget>[
                     SizedBox(
                       width: 30,
                     ),
                     Text(
                       "Semesters",
                       style: TextStyle(
                         color: Color.fromRGBO(80, 90, 175, 1),
                         fontWeight: FontWeight.bold,
                         fontSize: 25.0,
                       ),
                     ),
                   ],
                 ),
               ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      clipOvalImage("assets/Semester/1.png",id1.toString()),
                      clipOvalImage("assets/Semester/2.png",id2.toString()),
                      clipOvalImage("assets/Semester/3.png",id3.toString()),
                      clipOvalImage("assets/Semester/4.png",id4.toString()),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      clipOvalImage("assets/Semester/5.png",id5.toString()),
                      clipOvalImage("assets/Semester/6.png",id6.toString()),
                      clipOvalImage("assets/Semester/8.png",id7.toString()),
                      clipOvalImage("assets/Semester/7.png",id8.toString()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Edubile Specials",
                          style: TextStyle(
                            color: Color.fromRGBO(80, 90, 175, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0,0,0,0),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        myArticles('assets/Categories/WD.png'),
                        myArticles('assets/Categories/pl.png'),
                        myArticles('assets/Categories/corec.png'),
                        myArticles('assets/Categories/mech.png'),
                        myArticles('assets/Categories/maths.png'),
                      ],
                    ),
                  ),
                  ],
                ),
            ),
    ),
    );
  }
}
