import 'package:flutter/material.dart';
import 'package:assignment/dataService.dart';
import 'package:assignment/models.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _cityTextController = TextEditingController();
/*  final _stateTextController = TextEditingController();
  final _countryTextController = TextEditingController();*/
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
             /* Padding(
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
              ),*/
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ]
          )
        )
      )
    );
  }
  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    print(response.weatherinfo);
  }
}




