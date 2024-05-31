import 'package:carbonfootprint/main.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

String CarbonCalculated ="list addition has taken place first" ;
Map MapCarbon = {"":""} ;
Future apiCall(String url)async
{
  http.Response response;
  response = await http.get(Uri.parse(url));
  if (response.statusCode == 201 ||response.statusCode ==202||response.statusCode==200||response.statusCode == 203) {

      CarbonCalculated = response.body ;
      print(CarbonCalculated) ;
      MapCarbon = json.decode(response.body) ;
      print(MapCarbon['co2e_kg']) ;
      return MapCarbon['co2e_kg'];
  }
  else
    print(response.statusCode+"Error in recieving data") ;
}
