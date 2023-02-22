import 'package:demopunch/HrRequirement/LeaverequestIcon.dart';
import 'package:flutter/material.dart';

class AllLeaveRequest extends StatefulWidget {
  const AllLeaveRequest({super.key});

  @override
  State<AllLeaveRequest> createState() => _AllLeaveRequestState();
}

class _AllLeaveRequestState extends State<AllLeaveRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
         leading: IconButton(onPressed: () {
           Navigator.pop(context);
         }, icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 10, 21, 81),)),
        title: const Text('Leave Requests',style: TextStyle(color: Color.fromARGB(255, 10, 21, 81)),),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.grey,
        backgroundColor:Color.fromARGB(255, 10, 21, 81),
        child: Icon(Icons.add),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LeaverequestIcon(),));
      },), 
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                return ListTile(
                    title: Text('Sick leave'),
                    subtitle: Text('Reason for leave'),
                    leading: Icon(Icons.contact_page_sharp,color: Color.fromARGB(255, 10, 21, 81)),
                );
              },),
            ),
        ],
      )
    );
  }
}