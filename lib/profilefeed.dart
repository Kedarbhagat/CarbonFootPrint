import 'package:carbonfootprint/main.dart';
import 'package:flutter/material.dart';
class feed extends StatefulWidget {
  const feed ({Key? key}) : super(key: key);

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Row(
          children: [
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return Carbon()  ;
             })) ;
              },
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Profile Overview",
                        style: TextStyle(
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
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                      child: Text(
                        "Profile Feed ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue ,
                        ),
                      )),
                  Divider(
                    color: Colors.blue,
                    thickness: 2,
                  )
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


      ],
    )
    ) ;

  }
}
