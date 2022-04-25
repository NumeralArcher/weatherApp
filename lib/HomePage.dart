import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'package:assignment/dataService.dart';
import 'dataService.dart';
import 'package:assignment/weatherSearch.dart';
import 'weatherSearch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        drawer: MyDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        ),
      )
    );
  }
}
