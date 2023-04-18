import 'package:flutter/material.dart';
import "package:quoteapp/models/container.dart";
import "package:geolocator/geolocator.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quoteapp/screens/city_screen.dart';
import 'package:quoteapp/service/weather.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
  final LocationWeather;
  Location({required this.LocationWeather});

  getMoreLocation() {}
}
//https://api.weatherapi.com/v1/current.json?key=98154a01d1a04af2a5b134159233003&q=Gujarat

class _LocationState extends State<Location> {
  late int temp;
  late String city;
  late String condition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.LocationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      
    
    if (weatherData == null) {
      temp = 0;
      city = "";
    }
    var latitude = weatherData["location"]["lat"];
    double temp1 = weatherData["current"]["temp_c"];
    temp = temp1.toInt();
    var longitude = weatherData["location"]["lon"];
    city = weatherData["location"]["name"];
    print(temp);
    print(city);
    });
  }

  WeatherModel weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/location.png'),
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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await WeatherModel().WeatherLocation();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var city_weather = await Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if(city_weather != null){
                        var weather =await weatherModel.getCityWeather(city_weather);
                        updateUi(weather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp℃',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherModel.getMessage(temp)}in $city",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
