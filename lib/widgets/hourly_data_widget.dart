import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

// card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
         
          child: const Text(
            'Today',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
         SizedBox(height: 10,),
        hourlylist(),
       
         SizedBox(height: 30,)
      ],
    );
  }

  Widget hourlylist() {
    return Container(
       color:  Color.fromARGB(255, 255, 255, 255),
       height: 160,
      // padding: const EdgeInsets.only( bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  
                  width: 90,
                 
                  // margin: const EdgeInsets.only(left: 20, right: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 202, 221, 255),
                      borderRadius: BorderRadius.circular(12),
                      // boxShadow:  [
                      //   BoxShadow(
                      //     offset: Offset(0.5, 0),
                      //     blurRadius: 30,
                      //     spreadRadius: 1,
                      //     color: CustomColors.dividerLine.withAlpha(150),
                      //   ),
                      // ],
                      gradient: cardIndex.value == index
                          ? const LinearGradient(
                              colors: [
                                 CustomColors.firstGradientColor,
                                Color.fromARGB(255, 5, 22, 46)
                              ],
                            )
                          : null),
                  child: HourlyDetails(
                    index: index,
                    cardIndex: cardIndex.toInt(),
                    temp: weatherDataHourly.hourly[index].temp!,
                    timestamp: weatherDataHourly.hourly[index].dt!,
                    weatherIcon:
                        weatherDataHourly.hourly[index].weather![0].icon!,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// hourly details class
class HourlyDetails extends StatelessWidget {
  int temp;
  int timestamp;
  String weatherIcon;
  int index;
  int cardIndex;

  
  HourlyDetails(
      {Key? key,
      required this.cardIndex,
      required this.index,
      required this.timestamp,
      required this.temp,
      required this.weatherIcon});

      String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timestamp),
          style: TextStyle(color: cardIndex == index ? Colors.white : CustomColors.textColorBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text('$temp°',
          style: TextStyle(color: cardIndex == index ? Colors.white : CustomColors.textColorBlack),
          ),
        )
      ],
    );
  }
}
