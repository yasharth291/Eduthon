import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

void main(){
  runApp(Pdf());
}

class Pdf extends StatefulWidget {
  @override
  pdt_State createState() => pdt_State();
}

class pdt_State extends State<Pdf> {

  bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isInit?
                Text('Press button to load PDf file')
                    :_isLoading
                    ?Center(
                  child: CircularProgressIndicator(),
                )
                    : PDFViewer(
                  document: document,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                  RaisedButton(
                    color: Colors.deepPurple,
                    child: Text("Open"),
                    onPressed: (){
                      loadFromAssets();
                    },
                  ),
                ),
                Expanded(
                  child:
                  RaisedButton(
                    color: Colors.deepPurple,
                    child: Text("Add to fav"),
                    onPressed: (){
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  loadFromAssets() async{
    setState(() {
      _isInit = false;
      _isLoading = true;
    });
    document = await PDFDocument.fromAsset("assets/Wk11-CS102-Data Structures-TREEs.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
