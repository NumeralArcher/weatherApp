import 'dart:convert';

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
// To parse this JSON data, do
//
//     final weatherResponse = weatherResponseFromJson(jsonString);

WeatherResponse weatherResponseFromJson(String str) => WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) => json.encode(data.toJson());

class WeatherResponse {
  WeatherResponse({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });

  String city;
  String state;
  String country;
  Location location;
  Current current;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    city: json["city"],
    state: json["state"],
    country: json["country"],
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "country": country,
    "location": location.toJson(),
    "current": current.toJson(),
  };
}

class Current {
  Current({
    required this.pollution,
    required this.weather,
  });

  Pollution pollution;
  Weather weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    pollution: Pollution.fromJson(json["pollution"]),
    weather: Weather.fromJson(json["weather"]),
  );

  Map<String, dynamic> toJson() => {
    "pollution": pollution.toJson(),
    "weather": weather.toJson(),
  };
}

class Pollution {
  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });

  DateTime ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;

  factory Pollution.fromJson(Map<String, dynamic> json) => Pollution(
    ts: DateTime.parse(json["ts"]),
    aqius: json["aqius"],
    mainus: json["mainus"],
    aqicn: json["aqicn"],
    maincn: json["maincn"],
  );

  Map<String, dynamic> toJson() => {
    "ts": ts.toIso8601String(),
    "aqius": aqius,
    "mainus": mainus,
    "aqicn": aqicn,
    "maincn": maincn,
  };
}

class Weather {
  Weather({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });

  DateTime ts;
  int tp;
  int pr;
  int hu;
  double ws;
  int wd;
  String ic;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    ts: DateTime.parse(json["ts"]),
    tp: json["tp"],
    pr: json["pr"],
    hu: json["hu"],
    ws: json["ws"].toDouble(),
    wd: json["wd"],
    ic: json["ic"],
  );

  Map<String, dynamic> toJson() => {
    "ts": ts.toIso8601String(),
    "tp": tp,
    "pr": pr,
    "hu": hu,
    "ws": ws,
    "wd": wd,
    "ic": ic,
  };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

/*class weatherResponse{
  final DataInfo dateInfo;
  //final TemperatureInfo tempInfo;
  //final Weatherinfo weatherinfo;
  *//*String get iconUrl{
    return 'https://airvisual.com/images${weatherinfo.icon}.png';
  }*//*

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
}*/

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
