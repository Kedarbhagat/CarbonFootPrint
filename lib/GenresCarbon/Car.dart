import 'package:carbonfootprint/dataAPI.dart';
import 'package:carbonfootprint/main.dart';
import 'package:flutter/material.dart';

String result = "1" ;
class car1 extends StatefulWidget {
  const car1({Key? key}) : super(key: key);

  @override
  State<car1> createState() => _car1State();
}

class _car1State extends State<car1> {



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 30,
                ) ,
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the distance"
                  ),
                ) ,
                TextButton(onPressed: ()async{
                  await apiCall("https://api-carbon-footprint.onrender.com/api/v1/cartravel?distance=20&vehicle=SmallDieselCar") ;
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Carbon() ;
                  })) ;
                  tasks.add(ListTile(
                   trailing: Text(CarbonCalculated),
                 )) ;
                }, child: Text("Enter")) ,
                Text(result) ,

              ],
            ),
          ),
        ),
      ),
    );
  }
}

