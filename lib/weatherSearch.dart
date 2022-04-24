import 'package:assignment/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:assignment/dataService.dart';
import 'models.dart';
import 'dataService.dart';

class weatherSearch extends StatefulWidget {


  @override
  State<weatherSearch> createState() => _weatherSearchState();
}

class _weatherSearchState extends State<weatherSearch> {

  final _cityTextController = TextEditingController();
  final _stateTextController = TextEditingController();
  final _countryTextController = TextEditingController();
  final _dataService = dataService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _stateTextController,
                        decoration: InputDecoration(labelText: 'state'),
                        textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _countryTextController,
                        decoration: InputDecoration(labelText: 'Country'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final response = await _dataService.getWeather(_cityTextController.text,_stateTextController.text,_countryTextController.text);
                      final String cityName = response.data.city;
                      final String temp = response.data.current.weather.tp.toString();
                      final String airQual = response.data.current.pollution.aqius.toString();
                      final String humidity = response.data.current.weather.hu.toString();
                      final String windSpeed = response.data.current.weather.ws.toString();
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => HomePage(cityName,temp,airQual,humidity,windSpeed)));
                }, child: Text('Search'))
              ],
            ),
          ),
        ));
  }

  }
