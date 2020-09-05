import 'package:eduthon/pages/video_list.dart';
import 'package:flutter/material.dart';
import 'components/rounded_button.dart';

class video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: vedioplayer(),
    );
  }
}

class vedioplayer extends StatefulWidget {
  @override
  v_State createState() => v_State();
}

class v_State extends State<vedioplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 250, 1),
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
                        width: 120,
                      ),
                      Text(
                        "Materials",
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
                height: 50,
              ),
              Center(
                  child : RoundedButton(
                    text: "VIDEOS",
                    textColor: Colors.white,
                    press: (){
                      Navigator.push(
                          context,
                      MaterialPageRoute(
                       builder: (context){
                         return vediolists();
                       }
                      )
                      );

                    },
                  )
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RoundedButton(
                  text: "NOTES",
                  textColor: Colors.white,
                  press: (){
                    },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RoundedButton(
                  text: "PAST TESTS",
                  textColor: Colors.white,
                  press: (){
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
