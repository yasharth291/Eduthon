import 'package:flutter/material.dart';
import 'vedio.dart';
class videolist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: vediolists(),
    );
  }
}

class vediolists extends StatefulWidget {
  @override
  vt_State createState() => vt_State();
}

class vt_State extends State<vediolists> {

  Container myArticles(String video_heading, String vedio_Size) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
          child: RaisedButton(
            color: Color.fromRGBO(230, 230, 250, 1),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        video_heading,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        vedio_Size,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Icon(
                      Icons.arrow_downward,
                      )
                    ],
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return Vedio();
                          }
                    ),
                    );
                  }
              ),
    );
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
         child: Column(
           children: <Widget>[
             Image.asset("assets/bg1.png"),
             SizedBox(
               height: 10,
             ),
             Container(
                 child: Row(
                   children: <Widget>[
                     SizedBox(
                       width: 30,
                     ),
                     Text(
                       "Video list ",
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: Color.fromRGBO(126, 46, 132, 1),
                         fontSize: 40.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),

                   ],
                 )
             ),
             SizedBox(
               height: 10,
             ),
             ListView(
               shrinkWrap: true,
               padding: const EdgeInsets.all(8),
               children: <Widget>[
                          myArticles("lecture 1" , "8 MB"),
                          myArticles("lecture 2", "12 MB"),
               ],
             )
           ],
         ),
        ),
      ),
    );
  }
}

