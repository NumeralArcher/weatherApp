import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models.dart';

class dataService{
  Future<weatherResponse> getWeather(String city) async{
    var request = http.Request('GET', Uri.parse('http://api.airvisual.com/v2/city?city='+ city +'&state=California&country=USA&key=6c95d31a-fc0b-44e5-a6ae-ae0e5a0fef45'));

    http.StreamedResponse response = await request.send();
    var bawls = "";

    if (response.statusCode == 200) {
      bawls = await response.stream.bytesToString();
      print(bawls);
      //print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
    final json = jsonDecode(bawls);
    return weatherResponse.fromJson(json);
  }
}