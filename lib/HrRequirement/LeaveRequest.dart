import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {

  TextEditingController dateinput = TextEditingController(); 

    void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Color.fromARGB(255, 10, 21, 81),),
        title: Text('Leave Request',style: TextStyle(color: Color.fromARGB(255, 10, 21, 81)),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
                    child: Text('Vacation And Sick Leave Form',style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Employee Name',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                label: Text("Employee name",style: TextStyle(color: Colors.black),),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Text('Employee Type',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: DropdownButtonFormField(
                       hint: Text("Please Select"),
                  isExpanded: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  items: [
                    'Full Time',
                    'Part Time',
                    "Remote"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    
                  },
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Text('DepartMent',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: DropdownButtonFormField(
                       hint: Text("Please Select"),
                  isExpanded: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  items: [
                    'Marketing ',
                    'Sales',
                    "Human Resource",
                    'Product',
                    'Finance'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    
                  },
                        ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Text('Title',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                label: Text("Title",style: TextStyle(color: Colors.black),),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Text('Leave Type',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: DropdownButtonFormField(
                       hint: Text("Please Select"),
                  isExpanded: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  items: [
                    'Sick Leave ',
                    'Vacation',
                    "Maternity Leave",
                    'Paternity Leave',
                    'Casual Leave',
                    'Half Day Leave',
                    'Work From Home'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    
                  },
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Text('Leave date',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration( 
                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                     icon: Icon(Icons.calendar_today,color: Colors.black,), //icon of text field
                     labelText: "Enter Date", labelStyle: TextStyle(color: Colors.black),//label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );
                    
                    if(pickedDate != null ){
                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                           dateinput.text = formattedDate; //set output date to TextField value. 
                        });
                    }else{
                        print("Date is not selected");
                    }
                },
             ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Text('Return date',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration( 
                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                     icon: Icon(Icons.calendar_today,color: Colors.black,), //icon of text field
                     labelText: "Enter Date" ,labelStyle: TextStyle(color: Colors.black),///label text of field
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );
                    
                    if(pickedDate != null ){
                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                           dateinput.text = formattedDate; //set output date to TextField value. 
                        });
                    }else{
                        print("Date is not selected");
                    }
                },
             ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: SizedBox(
                        width: 150,
                        child: MaterialButton(
                          height: 48,
                          color:  Color.fromARGB(255, 10, 21, 81),
                          child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),),
                          onPressed: () {
                          
                        },),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}