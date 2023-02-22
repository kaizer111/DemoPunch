import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaverequestIcon extends StatefulWidget {
  const LeaverequestIcon({super.key});

  @override
  State<LeaverequestIcon> createState() => _LeaverequestIconState();
}

class _LeaverequestIconState extends State<LeaverequestIcon> {


  TextEditingController dateinput = TextEditingController(); 

    void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(onPressed: () {
           Navigator.pop(context);
         }, icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 10, 21, 81),)),
        title: const Text('Request Leave',style: TextStyle(color: Color.fromARGB(255, 10, 21, 81)),),
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 25),
                    child: Text('Vacation And Sick Leave Form',style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  const Divider(),
                   const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Text('Title',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
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
                  const Divider(),
                  
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Text('Leave date',style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 10, 21, 81))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: const InputDecoration( 
                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                decoration: const InputDecoration( 
                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                          color:  const Color.fromARGB(255, 10, 21, 81),
                          child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),),
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