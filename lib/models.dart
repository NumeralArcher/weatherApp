import 'package:assignment/dataService.dart';
import 'package:assignment/main.dart';
/*{
  "status": "success",
  "data": {
    "name": "Eilat Harbor",
    "city": "Eilat",
    "state": "South District",
    "country": "Israel",
    "location": {
      "type": "Point",
      "coordinates": [
        34.939443,
        29.531814
      ]
    },
    "current": {
      "weather": {
        "ts": "2017-02-01T01:00:00.000Z",
        "tp": 12,
        "pr": 1020,
        "hu": 62,
        "ws": 2,
        "wd": 320,
        "ic": "01n"
      },
      "pollution": {
        "ts": "2017-02-01T01:15:00.000Z",
        "aqius": 18,
        "mainus": "p1", //main pollutant for US AQI
        "aqicn": 20,
        "maincn": "p1",  //main pollutant for Chinese AQI
        "p1": {   //pollutant details, concentration and appropriate AQIs
          "conc": 20,
          "aqius": 18,
          "aqicn": 20
        }
      }
    }
}*/
class weatherResponse{
  final TemperatureInfo tempInfo;
  final Weatherinfo weatherinfo;
  String get iconUrl{
    return 'https://airvisual.com/images${weatherinfo.icon}.png';
  }

  weatherResponse({required this.tempInfo, required this.weatherinfo});

  factory weatherResponse.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data']['current']['weather'];
    final dataInfo = TemperatureInfo.fromJson(dataJson);

    final weatherinfo = Weatherinfo.fromJson(dataJson);
    return weatherResponse(tempInfo: dataInfo, weatherinfo: weatherinfo);
  }
}

class Weatherinfo {
  final String description;
  final String icon;

  Weatherinfo({required this.description, required this.icon});

  factory Weatherinfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['ic'];
    return Weatherinfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['tp'];
    return TemperatureInfo(temperature: temperature);
  }
}


