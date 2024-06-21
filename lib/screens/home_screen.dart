import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/daily_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

import '../api/fetch_weather.dart';
import '../widgets/comfort_level.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // calling the global controller
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: SizedBox(
                    height: 450,
                    width: 250,
                    child: Column(
                      children: [
                        Lottie.asset('assets/weatherlottie.json'),
                        Text('By Prashant Chandraker 💙')
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      //Header part :- Location and date
                      HeaderWidget(),

                      // current tempreture(current) and icon
                      CurrentWeather(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),

                      // hourly weather update tab
                      HourlyDataWidget(
                          weatherDataHourly:
                              globalController.getData().getHourlyWeather()),

                      // Daily weather forecast
                      DailyWeatherForecast(
                          weatherDataDaily:
                              globalController.getData().getDailyWeather()),
                      SizedBox(
                        height: 10,
                      ),
                      //Divider line
                      Container(height: 1, color: Colors.grey.shade300),
                      SizedBox(
                        height: 20,
                      ),
                      Comfortlevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
