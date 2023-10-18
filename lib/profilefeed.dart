
import 'package:carbonfootprint/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
String cast ="0";
class feed extends StatefulWidget {
  const feed({Key? key}) : super(key: key);

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  TextEditingController limit = TextEditingController();
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
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Carbon();
                  }));
                },
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Profile Overview",

                        style: TextStyle(
                          color: Colors.purple.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Container(
                      child: Text(
                    "Profile Feed ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  )),
                  Divider(
                    color: Colors.blue,
                    thickness: 2,
                  )
                ],
              ),
              SizedBox(
                width: 50,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: limit,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      fillColor: Colors.purple,
                      focusColor: Colors.purple,
                      hintText: "Enter the limit of emission" ,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    cast=limit.text ;
                    MaxSetEmission=cast ;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Carbon() ;
                    })) ;
                  },
                  child: Text("Enter"),
                ),
              ],
            ),
          )
      ],
    ),
        ));
  }
}
