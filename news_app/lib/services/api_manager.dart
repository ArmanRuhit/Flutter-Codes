import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/newsinfo.dart';

class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    String api_key = '7fbbb8f4234b4c7188080f493b774bbd';
    var _param = {
      "domains": "wsj.com",
      "apiKey": api_key,
    };
    Uri uri = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$api_key');
    http.Response response = await client.get(uri);
    var newsModel = null;
    try {
      if (response.statusCode == 200) {
        String jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
    }
    return newsModel;
  }
}
