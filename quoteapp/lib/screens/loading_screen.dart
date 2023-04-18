import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:quoteapp/models/networking.dart";
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:quoteapp/models/networking.dart';
import 'package:quoteapp/screens/location.dart';
import 'package:quoteapp/service/weather.dart';


//https://api.weatherapi.com/v1/current.json?key=98154a01d1a04af2a5b134159233003&q=Gujarat

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  void getLocation() async {
    
    var weatherData = await WeatherModel().WeatherLocation();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Location(
                  LocationWeather: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
