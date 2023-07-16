import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/home_banner_model.dart';

var base = "https://catseyeleather.com/api";
getHomeBanners() async {
  Uri url = Uri.parse("$base/CatsHomebannercs/GetHomebanners");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = catsHomeBannerFromJson(res.body);
      return data;
    } else {
      print("error during connection");
    }
  } catch (e) {
    print(e.toString());
  }
}
