import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyWeatherForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyWeatherForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        color: Color.fromARGB(255, 202, 221, 255),
        child: Column(
          children: [
            // SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.red,
                alignment: Alignment.topLeft,
                // margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Next Days',
                  style:
                      TextStyle(color: CustomColors.textColorBlack, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            dailylist(),
            
          ],
        ),
      ),
    );
    
  }

  Widget dailylist() {
    return Container(
      // color: Colors.amber,
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                 padding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(weatherDataDaily.daily[index].dt),
                        style: TextStyle(color: CustomColors.textColorBlack, fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                     SizedBox(
                      width: 80,
                      child: Image.asset('assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                    ),
                    Text('${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°',
                    style: TextStyle(color: CustomColors.textColorBlack, fontSize: 18, fontWeight: FontWeight.w400),
                    ), 

                  ],
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(height: 1,
                color: Colors.blueGrey.shade200,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
