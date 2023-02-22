import 'dart:convert';
import 'package:demopunch/Dashboard.dart';
import 'package:demopunch/Homepage.dart';
import 'package:demopunch/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernamecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    getLogInDetails() async{
      try {
        var response = await http.post(Uri.parse("https://empdemo.rudrayati.co.in/createStamp"),body: {
        "employee_id": "45678-Rohi"
      });
      print(response.body);
      } catch (e) {
        print(e);
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 0, 25),
                child: Text('Login Here ',style: TextStyle(fontSize: 35),),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextFormField(
                          controller: usernamecontroller,
                          style: TextStyle(color: Colors.black),
                          validator: (val) {
                             if (val!.isEmpty) return "username cannot be empty";
                              },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            label: Text("username",style: TextStyle(color: Colors.black),),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextFormField(
                         // controller: usernamecontroller,
                          style: TextStyle(color: Colors.black),
                          validator: (val) {
                             if (val!.isEmpty) return "Password cannot be empty";
                              },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            label: Text("password",style: TextStyle(color: Colors.black),),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextFormField(
                          //controller: usernamecontroller,
                          style: TextStyle(color: Colors.black),
                          validator: (val) {
                             if (val!.isEmpty) return "Client id cannot be empty";
                              },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            label: Text("Client id",style: TextStyle(color: Colors.black),),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                child: Text('LOGIN',style: TextStyle(color: Colors.white),),
                onPressed: ()async {
            
                 await login();
               
              },),
            ),
          ],),
        ),
      ),
    );
  }

  login()async{
    final nav = Navigator.of(context);
     try {
    // Response res = await dio.post("https://empdemo.rudrayati.co.in/createStamp",data: json.encode(data));
      var response = await http.post(Uri.parse("https://empdemo.rudrayati.co.in/login"),
      body: {
            "employee_id": usernamecontroller.text,
      }
      );
    if(response.statusCode==200){
      var loginResData = jsonDecode(response.body) as Map<String,dynamic>;
      print(loginResData['flag']);
      if(loginResData['flag']){
         nav.push(MaterialPageRoute(builder: (context) => MainPage(userId: usernamecontroller.text),));
      }
     
    }
    } catch (e) {
      print(e);
    }
  }

}