import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
// create various variables

  final RxBool _isLoading =
      true.obs; // we write obs becz RxBool is reactive so to observe it
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

// instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

//oninit is similar to init state  without getx
  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error("Location permission is denied");
      }
    }

    // getting the current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ).then((value) {
      //update our lattitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    });
  }
}
