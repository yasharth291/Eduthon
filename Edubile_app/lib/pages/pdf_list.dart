import 'package:flutter/material.dart';
import 'pdf.dart';
class pdflist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pdflists(),
    );
  }
}

class pdflists extends StatefulWidget {
  @override
  pd_State createState() => pd_State();
}

class pd_State extends State<pdflists> {

  Container myArticles(String pd_heading, String pd_Size) {
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
                pd_heading,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                pd_Size,
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
                    return Pdf();
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
                  myArticles("lecture 1" , "12 MB"),
                  myArticles("lecture 2", "10 MB"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}