class WeatherResponse{
  final String cityName;
  final TemperatureInfo temperatureInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl{
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({this.cityName, this.temperatureInfo, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, temperatureInfo: tempInfo, weatherInfo: weatherInfo);
  }

}

class TemperatureInfo{
  final double temperature;

  TemperatureInfo({this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json){
    final temperature = json['temp'];

    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}
