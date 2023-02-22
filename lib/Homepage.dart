import 'dart:async';
import 'dart:convert';

import 'package:demopunch/HrRequirement/AllLeaveRequest.dart';
import 'package:demopunch/HrRequirement/LeaveRequest.dart';
import 'package:demopunch/HrRequirement/LeaverequestIcon.dart';
import 'package:demopunch/settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http ;

class HomePage extends StatefulWidget {

  //final String userId;

  //HomePage({required this.userId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool punchStatus = false;





  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
  punchIn () async{
    if(!punchStatus){
      setState(() {
        punchStatus=true;
      });
      Timer.periodic(Duration(seconds: 10), (timer)async {
        if(!punchStatus){
          timer.cancel();
        }
         Position p = await _determinePosition();
    Dio dio = Dio();
    try {
    // Response res = await dio.post("https://empdemo.rudrayati.co.in/createStamp",data: json.encode(data));
      var response = await http.post(Uri.parse("https://empdemo.rudrayati.co.in/createStamp"),
      body: {
            //"employee_id": widget.userId,
            "latitude": p.latitude.toString(),
            "longitude": p.longitude.toString()
      }
      );
     print(response.body);
    } catch (e) {
      print(e);
    }
      },);
    }
  }

  punchOut(){
    setState(() {
      punchStatus=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.cloud_upload,color: Color.fromARGB(255, 10, 21, 81)),
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(45, 60, 30, 10),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //       color: Colors.grey,
              //       offset: const Offset(
              //         5.0,
              //         5.0,
              //       ), //Offset
              //       blurRadius: 10.0,
              //       spreadRadius: 2.0,
              //     ), //BoxShadow
              //     BoxShadow(
              //       color: Colors.white,
              //       offset: const Offset(0.0, 0.0),
              //       blurRadius: 0.0,
              //       spreadRadius: 0.0,
              //     ),
              //       ]
              //     ),
              //     height: 150,
              //     //color: Colors.grey,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(top: 5),
              //               child: MaterialButton(
              //                 color: Colors.blue,
              //                 child: Text('PUNCH IN'),
              //                 onPressed: () async{
              //                   await punchIn();
              //               },),
              //             ),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 5),
              //               child: MaterialButton(
              //                 color: Colors.grey,
              //                 child: Text('PUNCH OUT'),
              //                 onPressed: () {
              //                 punchOut();
              //               },),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           height: 15,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 50),
              //           child: Text((punchStatus)?'Online...':'Offline',style: TextStyle(fontSize: 30),),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 90,
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   child: Text('LOGOUT',style: TextStyle(color: Colors.white),),
              //   onPressed: () {
              //   Navigator.pop(context);
              // },),
              Container(
                width: double.infinity,
                height: 280,
                color: Color.fromARGB(255, 171, 229, 222),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                      Icon(Icons.cloud_upload,color: Color.fromARGB(255, 10, 21, 81),size: 80,),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Company name ",style: TextStyle(color: Color.fromARGB(255, 10, 21, 81),fontSize: 20)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:8.0),
                        child: Text("Employee portal",style: TextStyle(color: Color.fromARGB(255, 10, 21, 81))),
                      ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                
                color: Color.fromARGB(255, 255, 236, 193),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text('Hr & Reqritement',style: TextStyle(fontSize: 23,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: Color.fromARGB(255, 255, 184, 95),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.person_add_alt_1,color: Color.fromARGB(255, 10, 21, 81),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text('Employee Refferal',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AllLeaveRequest(),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          color: Color.fromARGB(255, 255, 184, 95),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.airplanemode_active_rounded,color: Color.fromARGB(255, 10, 21, 81),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Leave Request',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text('Developement',style: TextStyle(fontSize: 23,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: Color.fromARGB(255, 255, 184, 95),
                        child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.connect_without_contact_outlined,color: Color.fromARGB(255, 10, 21, 81),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Training Request',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: Color.fromARGB(255, 255, 184, 95),
                        child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.book_rounded,color: Color.fromARGB(255, 10, 21, 81),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Book Request',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        color: Color.fromARGB(255, 255, 184, 95),
                        child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.tablet_android_sharp,color: Color.fromARGB(255, 10, 21, 81),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('E-Book Request',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81),fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

