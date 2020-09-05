import 'package:eduthon/pages/semester_body.dart';
import 'package:flutter/material.dart';

class semester extends StatelessWidget {
  int n;
  semester({this.n});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sem(n1 : n),
    );
  }
}
class sem extends StatefulWidget {
  int n1;
  sem({this.n1});
  @override
  sem_State createState() => sem_State(semester_number: n1);
}

class sem_State extends State<sem> {
  int semester_number;
  sem_State({this.semester_number});
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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context){
                    return vedioplayer();
                  }
              ),
            );
          }
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      "Semester " + semester_number.toString(),
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
              CustomScrollView(
                  primary: false,
                  shrinkWrap: true,
                  slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      myArticles('assets/Categories/WD.png'),
                      myArticles('assets/Categories/pl.png'),
                      myArticles('assets/Categories/corec.png'),
                      myArticles('assets/Categories/mech.png'),
                      myArticles('assets/Categories/maths.png'),
                  ],
                )
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

