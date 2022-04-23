import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class dataService{
  Future<WeatherResponse> getWeather(String city, String state, String country) async{
    var request = http.Request('GET', Uri.parse('http://api.airvisual.com/v2/city?city='+ city +'&state='+ state +'&country='+ country +'&key=6c95d31a-fc0b-44e5-a6ae-ae0e5a0fef45'));

    http.StreamedResponse response = await request.send();
    var holder = "";

    if (response.statusCode == 200) {
      holder = await response.stream.bytesToString();
      print(holder);
    }
    else {
      print(response.reasonPhrase);
    }
    final json = jsonDecode(holder);
    return WeatherResponse.fromJson(json);
  }
}