import 'package:carbonfootprint/GenresCarbon/Car.dart';
import 'package:carbonfootprint/GenresCarbon/bike.dart';
import 'package:carbonfootprint/GenresCarbon/flight.dart';
import 'package:carbonfootprint/GenresCarbon/fluelEmission.dart';
import 'GenresCarbon/publicTransist.dart';
import 'package:flutter/material.dart';
class send extends StatelessWidget {
  const send({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: check(),
    );
  }
}
class check extends StatefulWidget {
  const check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(onPressed: (){

                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return car1() ;
                    }))  ;
                  });
                }

                , child: Text("Car")),
              ) ,
              Expanded(
                child: TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  bike() ;
                    })) ;
                  });
                }, child: Text("bike")),
              ) ,
              Expanded(
                child: TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return flight() ;
                    })) ;
                  });
                }, child: Text("flight")),
              ) ,
              Expanded(
                child: TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return publicTransist() ;
                    })) ;
                  });
                }, child: Text("Public Transist")),
              ) ,
              Expanded(
                child: TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return flueEmission() ;
                    })) ;
                  });
                }, child: Text("Fuel emission")),
              ) ,


            ],
          ),
        ),
      ),
    );
  }
}
