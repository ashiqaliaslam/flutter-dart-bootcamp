import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    log('initState of LoadingScreen');
    super.initState();
    getLocationData(context);
    // getLocationData();
  }

  @override
  void deactivate() {
    log('deactivate of LoadingScreen');
    super.deactivate();
  }

  // void getLocationData() async {
  void getLocationData(BuildContext context) async {
    var weatherData = await WeatherModel().getLocationWeather();

    if (!context.mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log('build() of LoadingScreen');
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
