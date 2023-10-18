import 'package:carbonfootprint/GenresCarbon/hidden.dart';
import 'package:carbonfootprint/dataAPI.dart';
import 'package:carbonfootprint/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbonfootprint/brain.dart';
String vehicleType = "" ;

class flight extends StatefulWidget {
  const flight({Key? key}) : super(key: key);

  @override
  State<flight> createState() => _flightState();
}

class _flightState extends State<flight> {
  TextEditingController _distance  = TextEditingController()  ;
  String dropdownvalue = 'DomesticFlight';
  String vehicleChooes ="s";
  var items =[
    "DomesticFlight"      ,
    "ShortEconomyClassFlight" ,
    "ShortBusinessClassFlight" ,
    "LongEconomyClassFlight"  ,
    "LongPremiumClassFlight",
    "LongBusinessClassFlight"     ,
    "LongFirstClassFlight"     ,

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
                offset: Offset(0, 0.5), //(x,y)
                blurRadius: 5.0,
              )
            ]),
        child: SafeArea(
          child: Scaffold(
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
                      offset: Offset(0, 0.5), //(x,y)
                      blurRadius: 5.0,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
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
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _distance,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                    await apiCall("https://api-carbon-footprint.onrender.com/api/v1/flighttravel?distance=$dist&type=$dropdownvalue&format=json") ;
                    String adder = MapCarbon['co2e_kg'] ;
                    TotalEmissionDone= TotalEmissionDone+ double.parse(adder) ;
                    Brain() ;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Carbon() ;
                    })) ;
                    tasks.add(ListTile(
                      leading: Icon(Icons.flight,color: Colors.pinkAccent,),
                      title: Text(" $dropdownvalue Emission",style: TextStyle(
                          color: Colors.purple.shade400,
                          fontSize: 14
                      ),),
                      trailing: Text(MapCarbon['co2e_kg']+" kg",style: TextStyle(
                          color: Colors.purple.shade300,
                          fontWeight: FontWeight.bold),),
                    )) ;
                  }, child: Text("Enter")) ,
                  SizedBox(
                    height: 50,
                  ) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){},
                          onLongPress: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return hidden() ;
                        })) ;
                      }, child: Text(""))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

