// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/city_screen.dart';
import 'package:flutter_bootcamp/services/weather.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    required this.locationWeather,
    super.key,
  });

  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMessage;

  @override
  void initState() {
    log('initState of LocationScreen');
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  void deactivate() {
    log('deactivate of LocationScreen');
    super.deactivate();
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature ?? 0);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    log('build() called of LocationScreen');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    var weatherData = await weather.getLocationWeather();
                    updateUI(weatherData);
                  },
                  child: Icon(Icons.near_me, size: 50),
                ),
                TextButton(
                  onPressed: () async {
                    var typeName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ),
                    );
                    if (typeName != null) {
                      var weatherData = await weather.getCityWeather(typeName);
                      updateUI(weatherData);
                    }
                  },
                  child: Icon(Icons.location_city, size: 50),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text('$temperature°', style: kTempTextStyle),
                  Text(weatherIcon ?? '', style: kConditionTextStyle),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "$weatherMessage in $cityName",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              ),
            )
          ],
        )),
      ),
    );
  }
}


    //  var temperature = decodedData['main']['temp'];
    //   var condition = decodedData['weather'][0]['id'];
    //   String cityName = decodedData['name'];