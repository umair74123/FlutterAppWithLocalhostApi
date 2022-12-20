import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Studentlist extends StatefulWidget {
  const Studentlist({Key? key}) : super(key: key);

  @override
  State<Studentlist> createState() => _StudentlistState();
}

class _StudentlistState extends State<Studentlist> {
  @override
  List studentData=[];
  Future<void> deleteStudent(String id) async
  {
    String uri="http://192.168.56.1/StudentApiFlutter/delete.php";
    try
    {
      var data = await http.post(Uri.parse(uri),body: {"id":id});
     var reponse=jsonDecode(data.body);
     if(reponse["success"]=="true")
       {
         print("record deleted");
         getrecord();
       }
     else
       {
         print("some issue");
       }

    }
    catch(e){
      print(e);
    }
  }

  Future<void> getrecord() async
  {


    String uri="http://192.168.56.1/StudentApiFlutter/read.php";

    try
        {

          var data = await http.get(Uri.parse(uri));
          setState(() {
            studentData=jsonDecode(data.body);
          });

        }
        catch(e){
      print(e);

        }

  }



  void initState() {
    // TODO: implement initState
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("student list"),
      ),
      body: ListView.builder(
          itemCount: studentData.length
          ,
          itemBuilder: (context,index)
      {
        return Card(
          child:
          Column(
            children: [
              Row(
                children: [
                  Text("regno: "),
                  Text(studentData[index]["regno"]),
                ],
              ), Row(
                children: [
                  Text("name: "),
                  Text(studentData[index]["name"])
                ],
              ), Row(
                children: [
                  Text("department: "),
                  Text(studentData[index]["dept"])
                ],
              ), Row(
                children: [
                  Text("semester: "),
                  Text(studentData[index]["semester"]),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    print(studentData[index]['id']);
                    deleteStudent(studentData[index]['id']);
                  }, icon: Icon(Icons.delete,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.update,)),

                ],
              ),
             ],
          ),
        );
      }
      )

    );
  }
}
