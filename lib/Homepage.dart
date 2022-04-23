import 'package:assignment/Weather.dart';
import 'package:assignment/favorites.dart';
import 'package:assignment/observations.dart';
import 'package:assignment/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginpage.dart';

class Homepage extends StatefulWidget {
  @override
  Homepagestate createState() => Homepagestate();
}

class Homepagestate extends State<Homepage>{
  int index=0;
  final screens =[
    Weather(),
    favorites(),
    observations(),
    profile(),

  ];
  @override

  Widget build(BuildContext context) {
    final items=<Widget>[
      Icon (Icons. wb_sunny_sharp,size:30),
      Icon (Icons.favorite,size:30),
      Icon (Icons.description_outlined,size:30),
      Icon (Icons.person,size:30),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff347e80),
      appBar: AppBar(
        backgroundColor: Color(0xff347e80),
        //title: Text('Bottom Navigation Bar'),
        elevation: 0,
        centerTitle: true,
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        height: 60,
        onTap: (index) => setState(() => this.index =index),
        backgroundColor: Colors.transparent,
        color: Color(0xff95e7e7),
        buttonBackgroundColor: Color(0xffeeefef),
      ),
    );
  }
}