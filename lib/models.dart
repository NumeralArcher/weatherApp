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
  final DataInfo dateInfo;
  //final TemperatureInfo tempInfo;
  //final Weatherinfo weatherinfo;
  /*String get iconUrl{
    return 'https://airvisual.com/images${weatherinfo.icon}.png';
  }*/

  weatherResponse(this.dateInfo);
  //weatherResponse(required this.tempInfo, required this.weatherinfo});

  factory weatherResponse.fromJson(Map<String, dynamic> json) {
    final dataInfoJson = json['data '];
    final dataInfo = DataInfo.fromJson(dataInfoJson);
    //final dataJson = json['data']['current']['weather'];
    //final dataInfo = TemperatureInfo.fromJson(dataJson);
    //final weatherinfo = Weatherinfo.fromJson(dataJson);
    return weatherResponse(dateInfo: dataInfo);
   // return weatherResponse(tempInfo: dataInfo, weatherinfo: weatherinfo);
  }
}

class DataInfo {
  final
  DataInfo({this.currentInfo});

  factory DataInfo.fromJson(Map<String, dynamic> json){
    final currentInfo = json['current'];
    return DataInfo(currentInfo: currentInfo);
  }
}

/*class Weatherinfo {
  final String ;
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
//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },

  "name": "Mountain View",
}
 */

/*class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({this.cityName, this.tempInfo, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}*/
/*class weatherResponse {
  String? status;
  Data? data;

  weatherResponse({this.status, this.data});

  weatherResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? city;
  String? state;
  String? country;
  Location? location;
  Current? current;

  Data({this.city, this.state, this.country, this.location, this.current});

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    country = json['country'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Current {
  Pollution? pollution;
  Weather? weather;

  Current({this.pollution, this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    pollution = json['pollution'] != null
        ? new Pollution.fromJson(json['pollution'])
        : null;
    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pollution != null) {
      data['pollution'] = this.pollution!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.toJson();
    }
    return data;
  }
}

class Pollution {
  String? ts;
  int? aqius;
  String? mainus;
  int? aqicn;
  String? maincn;

  Pollution({this.ts, this.aqius, this.mainus, this.aqicn, this.maincn});

  Pollution.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    aqius = json['aqius'];
    mainus = json['mainus'];
    aqicn = json['aqicn'];
    maincn = json['maincn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['aqius'] = this.aqius;
    data['mainus'] = this.mainus;
    data['aqicn'] = this.aqicn;
    data['maincn'] = this.maincn;
    return data;
  }
}

class Weather {
  String? ts;
  int? tp;
  int? pr;
  int? hu;
  double? ws;
  int? wd;
  String? ic;

  Weather({this.ts, this.tp, this.pr, this.hu, this.ws, this.wd, this.ic});

  Weather.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    tp = json['tp'];
    pr = json['pr'];
    hu = json['hu'];
    ws = json['ws'];
    wd = json['wd'];
    ic = json['ic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['tp'] = this.tp;
    data['pr'] = this.pr;
    data['hu'] = this.hu;
    data['ws'] = this.ws;
    data['wd'] = this.wd;
    data['ic'] = this.ic;
    return data;
  }
}
*/
