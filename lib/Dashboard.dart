import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http ;

class DashBoard extends StatefulWidget {
  // final String userId;
  // const DashBoard({required this.userId});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
      body: Column(
        children: [
           Padding(
                padding: const EdgeInsets.fromLTRB(45, 60, 30, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ), //Offset
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                    ]
                  ),
                  height: 150,
                  //color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MaterialButton(
                              color: Colors.blue,
                              child: Text('PUNCH IN'),
                              onPressed: () async{
                                await punchIn();
                            },),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MaterialButton(
                              color: Colors.grey,
                              child: Text('PUNCH OUT'),
                              onPressed: () {
                              punchOut();
                            },),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text((punchStatus)?'Online...':'Offline',style: TextStyle(fontSize: 30),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              // MaterialButton(
              //   color: Colors.blue,
              //   child: Text('LOGOUT',style: TextStyle(color: Colors.white),),
              //   onPressed: () {
              //   Navigator.pop(context);
              // },),
        ],
      ),
    );
  }
}