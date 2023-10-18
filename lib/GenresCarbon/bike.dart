import 'package:carbonfootprint/dataAPI.dart';
import 'package:carbonfootprint/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbonfootprint/brain.dart';
String vehicleType = "" ;

class bike extends StatefulWidget {
  const bike({Key? key}) : super(key: key);

  @override
  State<bike> createState() => _bikeState();
}

class _bikeState extends State<bike> {
  TextEditingController _distance  = TextEditingController()  ;
  String dropdownvalue = 'SmallMotorBike';
  String vehicleChooes ="s";
  var items =[
    "SmallMotorBike" ,
    "MediumMotorBike" ,
    "LargeMotorBike",
  ] ;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.purple.shade100,
                Colors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: const Offset(0, 0.5), //(x,y)
                blurRadius: 5.0,
              )
            ]),
        child: Column(

          children: [
            const SizedBox(
              height: 30,
            ) ,
            Container(
              child:            DropdownButton(

                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _distance,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly

                ],
                decoration: InputDecoration(
                    hintText: "Enter the distance"
                ),
              ),
            ) ,
            TextButton(onPressed: ()async{
              var dist = _distance.text ;
              await apiCall("https://api-carbon-footprint.onrender.com/api/v1/motorbiketravel?distance=$dist&type=$dropdownvalue&format") ;
              String adder = MapCarbon['co2e_kg'] ;
              TotalEmissionDone= TotalEmissionDone+ double.parse(adder) ;
             Brain() ;
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Carbon() ;
              })) ;
              tasks.add(ListTile(
                leading: Icon(Icons.car_repair , color: Colors.pinkAccent,) ,
                title: Text(" $dropdownvalue Emission" , style: TextStyle(
                  color: Colors.purple.shade400,
                  fontSize: 14
                ),),
                trailing: Text(MapCarbon["co2e_kg"]+" kg" , style: TextStyle(
                    color: Colors.purple.shade300,
                    fontWeight: FontWeight.bold),),
              )) ;
            }, child: Text("Enter")) ,


          ],
        ),
      ),
    );
  }
}

