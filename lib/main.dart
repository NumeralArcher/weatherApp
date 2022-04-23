import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp( MyApp());

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter login UI',
      debugShowCheckedModeBanner:false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({Key? key} ): super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp= await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build (BuildContext){
    return Scaffold(
      body:FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return loginpage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}