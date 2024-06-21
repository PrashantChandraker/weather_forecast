import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class Comfortlevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const Comfortlevel({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: Text(
            'Comfort Level',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(trackWidth: 12),
                      infoProperties: InfoProperties(
                          bottomLabelText: 'Humidity',
                          bottomLabelStyle: TextStyle(
                              letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(100),
                          progressBarColors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text:  TextSpan(
                      children: [
                        TextSpan(
                          text: 'Feels Like  ',
                          style: TextStyle(
                              fontSize: 16,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '${weatherDataCurrent.current.feelsLike}',
                          style: TextStyle(
                              fontSize: 16,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text:  TextSpan(
                      children: [
                        TextSpan(
                          text: 'UV Index  ',
                          style: TextStyle(
                              fontSize: 16,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: '${weatherDataCurrent.current.uvIndex}',
                          style: TextStyle(
                              fontSize: 16,
                              height: 0.8,
                              color: CustomColors.textColorBlack,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
