import 'package:flutter/material.dart';
import '../services/networking.dart';
import 'package:clima/services/location.dart';

String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = "baa80af84153ba4e0d3e760d96f202af";

class WeatherModel {
  Future<dynamic> getCityWeather(var cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=imperial';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

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
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 68) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
