import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=baa80af84153ba4e0d3e760d96f202af'));
    if (response.statusCode == 200) {
      String data = response.body;
      Map decodedData = jsonDecode(data);

      double latitude = decodedData['coord']['lat'];
      double longitude = decodedData['coord']['lon'];
      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String city = decodedData['name'];

      print(latitude);
      print(longitude);
      print(temperature);
      print(condition);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
