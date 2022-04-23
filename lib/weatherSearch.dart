import 'package:flutter/material.dart';
import 'package:assignment/dataService.dart';

class weatherSearch extends StatefulWidget {
  const weatherSearch({Key? key}) : super(key: key);

  @override
  _weatherSearchState createState() => _weatherSearchState();
}
class _weatherSearchState extends State<weatherSearch> {

  final _cityTextController = TextEditingController();
  final _stateTextController = TextEditingController();
  final _countryTextController = TextEditingController();

  final _dataService = dataService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
            body: Center(
                child : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child : SizedBox(
                            width : 150,
                            child :TextField(
                                controller: _cityTextController,
                                decoration: InputDecoration(labelText: 'City'),
                                textAlign: TextAlign.center),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child : SizedBox(
                            width : 150,
                            child :TextField(
                                controller: _stateTextController,
                                decoration: InputDecoration(labelText: 'State'),
                                textAlign: TextAlign.center),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child : SizedBox(
                            width : 150,
                            child :TextField(
                                controller: _countryTextController,
                                decoration: InputDecoration(labelText: 'Country'),
                                textAlign: TextAlign.center),
                          )
                      ),

                      ElevatedButton(onPressed: _search, child: Text('Search'))
                    ]
                )
            )
        )
    );
  }
  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text,_stateTextController.text,_countryTextController.text);
    print(response.data.city);
    print(response.data.current.weather.tp);
    print(response.data.current.pollution.aqius);
  }
}

