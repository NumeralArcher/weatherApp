import 'package:assignment/HomePage.dart';
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

                      ElevatedButton(onPressed: HomePage(), child: Text('Search'))
                    ]
                )
            )
        )
    );
  }

}

