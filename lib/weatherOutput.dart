import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';
class weatherOutput extends StatefulWidget {
  const weatherOutput({Key? key ,required this.city,required this.state,required this.country,required this.temp,required this.airQual,required this.humidity,required this.windSpeed}) : super(key: key);

  final String city;
  final String state;
  final String country;
  final String temp;
  final String airQual;
  final String humidity;
  final String windSpeed;

  @override
  State<weatherOutput> createState() => _weatherOutputState();
}

//'${widget.title}'

class _weatherOutputState extends State<weatherOutput> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){
              addFavorite(city: '${widget.city}',state: '${widget.state}',country: '${widget.country}');
            }, icon: Icon(Icons.favorite_border))
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
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
                              '${widget.city}',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${widget.airQual}',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.temp}',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
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
                                    color: Colors.black54,
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
                            color: Colors.black54,
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
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  "Air quality",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
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

  Future addFavorite({required String city, required String state, required String country}) async{
    final docFav = FirebaseFirestore.instance.collection('favorites').doc();

    final json = {
      'city' : city,
      'state' : state,
      'country' : country,
    };

    await docFav.set(json);

  }
}
