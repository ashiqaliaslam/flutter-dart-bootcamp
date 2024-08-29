// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  void initState() {
    log('initState of the CityScreen');
    super.initState();
  }

  @override
  void deactivate() {
    log('deactivate of the CityScreen');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('build() called of CityScreen');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/city_background.jpg'),
          fit: BoxFit.cover,
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: kTextFieldInputDecoration,
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
