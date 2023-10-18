import 'package:syncfusion_flutter_charts/charts.dart';
import 'brain.dart';
import 'InformationSender.dart';

import 'package:flutter/material.dart';
import 'profilefeed.dart';


Color exceed = Colors.black;
String MaxSetEmission = "set limit";
double TotalEmissionDone = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      debugShowCheckedModeBanner: false,
      home: Carbon(),
    );
  }
}

List<Widget> tasks = [];
String test = '';

int count = 0;
List<SalesData> data = [SalesData("Mon", 0)];

class Carbon extends StatefulWidget {
  @override
  State<Carbon> createState() => _CarbonState();
}

class _CarbonState extends State<Carbon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade100,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purple.shade100,
          body: Center(
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        child: const Column(
                          children: [
                            Text(
                              "Profile Overview",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                            Divider(
                              color: Colors.blue,
                              thickness: 2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const feed(),
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
                                color: Colors.purple.shade300,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            const Divider()
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "TOTAL",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade200),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Text(
                        TotalEmissionDone.toStringAsFixed(4),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const Text(
                        "/",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      Text(
                        MaxSetEmission.toString() + " kg",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 500,
                        height: 500,
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: //Initialize the chart widget
                            SfCartesianChart(
                              borderColor: Colors.transparent,
                             borderWidth: 0,
                             backgroundColor: Colors.transparent,
                             primaryYAxis: CategoryAxis(
                               borderColor: Colors.purple,
                               axisLine: const AxisLine(
                                 color: Colors.purple
                               )
                             ),
                          primaryXAxis: CategoryAxis(

                              axisLine: const AxisLine(
                                color: Colors.purple
                              ),
                              majorGridLines: const MajorGridLines(width: 0),
                              minorGridLines: const MinorGridLines(
                                width: 0,
                              )),
                          // Enable legend
                          legend: const Legend(isVisible: false),
                          // Enable tooltip
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                              color: Colors.purple ,
                              dataSource: data,

                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: 'Emission',
                              // Enable data label
                              dataLabelSettings: const DataLabelSettings(
                                  color: Colors.purple, isVisible: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.white,
                                Colors.purple.shade50,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Emission",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple.shade400),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const check();
                                      }));
                                    },
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          color: Colors.purple.shade400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "TOTAL",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple.shade200,
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
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
