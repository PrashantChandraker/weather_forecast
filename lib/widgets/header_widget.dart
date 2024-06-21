import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  // calling the global controller
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    // method from GeoCoding package
    List<Placemark> placemark =
        await placemarkFromCoordinates(lat, lon); // lattitude and longitude
    print(placemark);
    Placemark place = placemark[0];
    setState(() {
      city = place
          .locality!; // locality is the feild name in the placemark inside geolocator package
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 10,),
          alignment: Alignment.topLeft,
          child: Text(
            city, // city name
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, bottom: 20,),
          alignment: Alignment.topLeft,
          child: Text(
            date,  // todays date
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
