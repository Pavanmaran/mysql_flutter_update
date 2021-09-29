import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  bool visible = false ;
  String state = 'on';
  Future webCall() async{
    // Showing CircularProgressIndicator using State.
    setState(() {
      visible = true;
    });

    // API URL
    var url = 'http://localhost/test/submit_data.php';

    // Store all data with Param Name.
    var data = {'state': state};

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Smart ScienTech"),
        ),
        body: Center(
          child: Container(
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 200),
                  Container(
                   // color: Colors.teal,
                    child: FloatingActionButton(
                      onPressed: (){
                        setState(() {
                          state="on";
                        });
                        webCall();
                      },
                      child: Text("ON"),
                    ),
                  ),
                  SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        state="off";
                      });
                      webCall();
                    },
                    child: Text('OFF'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

