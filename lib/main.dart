import 'InformationSender.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'profilefeed.dart';
import 'package:http/http.dart'as http;
import 'dart:math';
import 'dataAPI.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Carbon(),
    );
  }
}

List<Widget> tasks = [];
String test = '' ;
double MaxSetEmission = 187.9;
double TotalEmissionDone = 162.2;
int count = 0 ;
class Carbon extends StatefulWidget {
  final List<FlSpot> dummy = List.generate(15, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  State<Carbon> createState() => _CarbonState();
}

class _CarbonState extends State<Carbon> {

  @override

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          "Profile Overview",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Divider(
                          color: Colors.blue,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              feed(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                            child: Text(
                          "Profile Feed ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Divider()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "TOTAL",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(178, 181, 183, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(children: [
                  Text(
                    TotalEmissionDone.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    "/",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    MaxSetEmission.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: List.generate(15, (index) {
                                return FlSpot(index.toDouble(),
                                    index * Random().nextDouble());
                              }),
                              isCurved: false,
                              barWidth: 2,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0, 1.8), //(x,y)
                            blurRadius: 9.0,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Emission",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed:(){

                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return check() ;


                       })) ;

                                },
                                child: Text("Edit"),
                              ),



                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "TOTAL",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(178, 181, 183, 1),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: tasks,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
