import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'package:assignment/dataService.dart';
import 'dataService.dart';
import 'package:assignment/weatherSearch.dart';
import 'weatherSearch.dart';

class HomePage extends StatelessWidget {

  final _dataService = dataService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF263238),
                    Color(0xff37474F),
                    Color(0xFF455A64)
                  ]
              )
          ),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              padding: EdgeInsets.all(15),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              "City",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "City name",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Temperature",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Temperature icon",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Air quality',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Air quality",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white, shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    )),
                                    onPressed: () {
                                    },

                                    child: const Text(
                                      'Add Observation',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),

    );
  }
  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text,_stateTextController.text,_countryTextController.text);
    print(response.data.city);
    print(response.data.current.weather.tp);
    print(response.data.current.pollution.aqius);
  }
}
