import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../model/model.dart';
import '../model/weatheer_model.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';
  String anotherUrl =
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m";

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<WeatherModel> getWeather() async {
    Response response = await get(Uri.parse(anotherUrl));
    log("Status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body);
      WeatherModel weather = WeatherModel.fromJson(result);
      return weather;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
