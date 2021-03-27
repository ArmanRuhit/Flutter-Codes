import 'package:day_11_weather_app/data_service.dart';
import 'package:day_11_weather_app/models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  DataService _dataService = DataService();
  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(_response!=null)
                Column(
                  children: [
                    Image.network(_response.iconUrl),
                    Text(
                      '${_response.temperatureInfo.temperature}°',
                      style: TextStyle(
                        fontSize: 40
                      ),
                    ),
                    Text(
                      _response.weatherInfo.description,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: _search,
                  child: Text("Search")
              )
            ],
          ),
        ),
      ),
    );
  }

  void _search() async{
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() {
      _response = response;
    });
  }

}
