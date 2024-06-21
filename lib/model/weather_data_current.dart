import 'package:weatherapp_starter_project/model/weather/feels_like.dart';

class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  // int? sunrise;
  // int? sunset;
  int? temp;

  double? feelsLike;
  int? humidity;
  double? uvIndex;
  int? clouds;
  // int? visibility;
  double? windSpeed;

  List<Weather>? weather;

  Current(
      {this.temp,
      this.humidity,
      this.clouds,
      this.windSpeed,
      this.weather,
      this.feelsLike,
      this.uvIndex});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        feelsLike: (json['feels_like'] as num?)?.toDouble(), // string should match postman data
        uvIndex: (json['uvi'] as num?)?.toDouble(),
        temp: (json['temp'] as num?)?.round(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'uvi' : uvIndex,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
