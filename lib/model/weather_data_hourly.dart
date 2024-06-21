class WeatherDataHourly{
  List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) => 
      WeatherDataHourly(hourly: List<Hourly>.from(json['hourly'].map((e)=> Hourly.fromJson(e))));

}


class Hourly {
  int? dt;
  int? temp;
  // double? feelsLike;
  // int? pressure;
  // int? humidity;
  // double? dewPoint;
  // double? uvi;
  // int? clouds;
  // int? visibility;
  // double? windSpeed;
  // int? windDeg;
  // double? windGust;
  List<Weather>? weather;
  double? pop;
  // Rain? rain;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
    this.pop,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        pop: (json['pop'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'pop': pop,
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
