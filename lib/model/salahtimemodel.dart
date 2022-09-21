// To parse this JSON data, do
//
//     final salahTimeModel = salahTimeModelFromJson(jsonString);

import 'dart:convert';

SalahTimeModel salahTimeModelFromJson(String str) =>
    SalahTimeModel.fromJson(json.decode(str));

String salahTimeModelToJson(SalahTimeModel data) => json.encode(data.toJson());

class SalahTimeModel {
  SalahTimeModel({
    required this.title,
    required this.query,
    required this.salahTimeModelFor,
    required this.method,
    required this.prayerMethodName,
    required this.daylight,
    required this.timezone,
    required this.mapImage,
    required this.sealevel,
    required this.todayWeather,
    required this.link,
    required this.qiblaDirection,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.countryCode,
    required this.items,
    required this.statusValid,
    required this.statusCode,
    required this.statusDescription,
  });

  String title;
  String query;
  String salahTimeModelFor;
  int method;
  String prayerMethodName;
  String daylight;
  String timezone;
  String mapImage;
  String sealevel;
  TodayWeather todayWeather;
  String link;
  String qiblaDirection;
  String latitude;
  String longitude;
  String address;
  String city;
  String state;
  String postalCode;
  String country;
  String countryCode;
  List<Item> items;
  int statusValid;
  int statusCode;
  String statusDescription;

  factory SalahTimeModel.fromJson(Map<String, dynamic> json) => SalahTimeModel(
        title: json["title"],
        query: json["query"],
        salahTimeModelFor: json["for"],
        method: json["method"],
        prayerMethodName: json["prayer_method_name"],
        daylight: json["daylight"],
        timezone: json["timezone"],
        mapImage: json["map_image"],
        sealevel: json["sealevel"],
        todayWeather: TodayWeather.fromJson(json["today_weather"]),
        link: json["link"],
        qiblaDirection: json["qibla_direction"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postal_code"],
        country: json["country"],
        countryCode: json["country_code"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        statusValid: json["status_valid"],
        statusCode: json["status_code"],
        statusDescription: json["status_description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "query": query,
        "for": salahTimeModelFor,
        "method": method,
        "prayer_method_name": prayerMethodName,
        "daylight": daylight,
        "timezone": timezone,
        "map_image": mapImage,
        "sealevel": sealevel,
        "today_weather": todayWeather.toJson(),
        "link": link,
        "qibla_direction": qiblaDirection,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "city": city,
        "state": state,
        "postal_code": postalCode,
        "country": country,
        "country_code": countryCode,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "status_valid": statusValid,
        "status_code": statusCode,
        "status_description": statusDescription,
      };
}

class Item {
  Item({
    required this.dateFor,
    required this.fajr,
    required this.shurooq,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  String dateFor;
  String fajr;
  String shurooq;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        dateFor: json["date_for"],
        fajr: json["fajr"],
        shurooq: json["shurooq"],
        dhuhr: json["dhuhr"],
        asr: json["asr"],
        maghrib: json["maghrib"],
        isha: json["isha"],
      );

  Map<String, dynamic> toJson() => {
        "date_for": dateFor,
        "fajr": fajr,
        "shurooq": shurooq,
        "dhuhr": dhuhr,
        "asr": asr,
        "maghrib": maghrib,
        "isha": isha,
      };
}

class TodayWeather {
  TodayWeather({
    required this.pressure,
    required this.temperature,
  });

  int pressure;
  String temperature;

  factory TodayWeather.fromJson(Map<String, dynamic> json) => TodayWeather(
        pressure: json["pressure"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "pressure": pressure,
        "temperature": temperature,
      };
}
