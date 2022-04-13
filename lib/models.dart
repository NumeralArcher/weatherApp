import 'package:assignment/dataService.dart';
import 'package:assignment/main.dart';
/*{
  "status": "success",
  "data": {
    "city": "Eilat",
    "state": "South District",
    "country": "Israel",
    "current": {
      "weather": {
        "tp": 12,
        "pr": 1020,
        "hu": 62,
        "ws": 2,
        "wd": 320,
        "ic": "01n"
      },
      "pollution": {
        "aqius": 18,
        "aqicn": 20,
      }
    }
}
*/
class weatherResponse{
  //final TemperatureInfo tempInfo;
  //final Weatherinfo weatherinfo;
  final String cityName;
  /*String get iconUrl{
    return 'https://airvisual.com/images${weatherinfo.icon}.png';
  }*/

  weatherResponse({required this.cityName});
    //required this.tempInfo, required this.weatherinfo});

  factory weatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['data '];
    //final dataJson = json['data']['current']['weather'];
    //final dataInfo = TemperatureInfo.fromJson(dataJson);

    final weatherinfo = Weatherinfo.fromJson(dataJson);
    return weatherResponse(tempInfo: dataInfo, weatherinfo: weatherinfo);
  }
}

/*class Weatherinfo {
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
}*/


