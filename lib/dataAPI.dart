import 'package:http/http.dart'as http;
import 'dart:convert';

String CarbonCalculated ="list addition has taken place first" ;
Map MapCarbon = {"":""} ;
Future apiCall(String url)async
{
  http.Response response;
  response = await http.get(Uri.parse(
      url));
  if (response.statusCode == 201) {

      CarbonCalculated = response.body ;
      MapCarbon = json.decode(response.body) ;
      print(CarbonCalculated) ;
      return CarbonCalculated;
  }
  else
    print("api not fetched") ;
}