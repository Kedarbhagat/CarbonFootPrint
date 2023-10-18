import 'package:carbonfootprint/GenresCarbon/Car.dart';
import 'package:carbonfootprint/GenresCarbon/Ecomerse.dart';
import 'package:carbonfootprint/GenresCarbon/Electricity.dart';
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
    return Container(
      color: Colors.purple.shade100,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    FloatingActionButton(
                        heroTag: "b1",
                        child: Icon(Icons.car_repair),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return car1();
                            }));
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Car",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    FloatingActionButton(
                        heroTag: "b2",
                        child: Icon(Icons.directions_bike),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return bike();
                            }));
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Bike",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "b3",
                      child: Icon(Icons.flight_takeoff),
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return flight();
                          }));
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Flight",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "b4",
                      child: Icon(Icons.electric_bolt),
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Electric();
                          }));
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Electricity",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "b5",
                      child: Icon(Icons.emoji_transportation),
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return publicTransist();
                          }));
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Public Transist",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "b6",
                      child: Icon(Icons.local_gas_station),
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return fuelEmission();
                          }));
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Fuel Emission",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
