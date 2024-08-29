import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  void getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<void> getCurrentLocation() async {
    getLocationPermission();
    // return await Geolocator.getCurrentPosition();
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.medium,
      distanceFilter: 100,
    );

    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;
      // print(latitude);
      // print(longitude);
    } catch (e) {
      print(e);
    }
  }
}
