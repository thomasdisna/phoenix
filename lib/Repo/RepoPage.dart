import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vphoenixtest/MODEL/newsModel.dart';






Future getNews() async {
  final response = await http.get(
    Uri.parse("https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"),
  );
  var qData = json.decode(response.body);
  return qData;
}

