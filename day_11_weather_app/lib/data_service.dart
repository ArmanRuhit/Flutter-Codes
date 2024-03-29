import 'dart:convert';

import 'package:day_11_weather_app/models.dart';
import 'package:http/http.dart' as http;

class DataService{
  Future<WeatherResponse> getWeather(String city) async{
    final queryParameters = {
      'q': city,
      'appid':'83a7a9c593d4ca9eba582d01a9b52f29',
      'units': 'imperial'
    };
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}