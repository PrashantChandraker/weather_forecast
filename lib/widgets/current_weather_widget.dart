import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeather({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        // tempreture area
        tempretureAreaWidget(),
       
        // more details - windspeed, humidty, clouds
        currentWeatherMoreDeatilsWidget(),
      ],
    ));
  }

  Widget tempretureAreaWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(
              "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
              height: 80,
              width: 80,
            ),
          ),
          // side line
          // Container(
          //   height: 50,
          //   width: 1,
          //   color: CustomColors.dividerLine,
          // ),
          // tempreture
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: '${weatherDataCurrent.current.temp!.toInt()}°',
                    style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 50,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text:
                        '${weatherDataCurrent.current.weather![0].description}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget currentWeatherMoreDeatilsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 8,
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/icons/windspeed.png"),
              ),
            ),
            Material(
               borderRadius: BorderRadius.circular(15),
              elevation: 8,
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/icons/clouds.png"),
              ),
            ),
            Material(
               borderRadius: BorderRadius.circular(15),
              elevation: 8,
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/icons/humidity.png"),
              ),
            ),
          ],
        ),
       const SizedBox(height: 10,),
       const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                'Windspeed',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                'Clouds',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                'Humidity',
                style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherDataCurrent.current.windSpeed} km/h',
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherDataCurrent.current.clouds}%',
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                '${weatherDataCurrent.current.humidity}%',
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
