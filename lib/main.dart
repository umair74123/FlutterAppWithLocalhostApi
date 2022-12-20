import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/studentlist.dart';
void main() {
  runApp(MaterialApp( home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController regno = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController semester = TextEditingController();

 Future<void> insertRecord() async
  {

        try{

          String uri="http://192.168.56.1/StudentApiFlutter/create.php";
          var data = await http.post(Uri.parse(uri), body:
          {
            "regno":regno.text,
            "name":name.text,
            "dept":dept.text,
            "semester":semester.text,
          }

          );
          print(regno.text);
          print(name.text);
          print(dept.text);
          print(semester.text);

          print("yes3");
          var reponse = jsonDecode(data.body);
          print("yes4");
          if(reponse=="Error")
            {
              print("some issue");
              
            }
          else
            {
              print(reponse);
            }
        }
        catch(e)
    {
      print(e);
    }

      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: regno,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Reg no',
                        hintText: 'Enter Your regno',
                      ),
                    ),
                  ), Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' Name',
                        hintText: 'Enter Your Name',
                      ),
                    ),
                  ), Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: dept,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' department',
                        hintText: 'Enter Your department',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: semester,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'semester',
                        hintText: 'Enter semester',
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(

                            child: Text('Regester'),
                            onPressed: (){
                              insertRecord();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(

                            child: Text('view data'),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Studentlist()),
                              );


                            },
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              )
          ),
        )
    );
  }
}