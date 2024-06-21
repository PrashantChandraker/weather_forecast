
import 'package:weatherapp_starter_project/api/api_key.dart';

String apiURL(var lat, var lon){
  String  url;

  url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apikey&exclude=minutely&units=metric";
  return url;
}
