import 'package:geolocator/geolocator.dart';

import '../models/networking.dart';
//https://api.weatherapi.com/v1/current.json?key=98154a01d1a04af2a5b134159233003&q=Gujarat

const api_key = "98154a01d1a04af2a5b134159233003";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityLocation) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.weatherapi.com/v1/current.json?key=$api_key&q=$cityLocation");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> WeatherLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.weatherapi.com/v1/current.json?key=$api_key&q=Gujarat");
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
