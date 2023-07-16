import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/cats_products_model.dart';

var base = "https://catseyeleather.com/api";
getHomePageProduct() async {
  Uri url = Uri.parse("$base/CatsProductdetails/GetProductdetails");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = homePageProductFromJson(res.body);
      return data;
    } else {
      print("error during connection");
    }
  } catch (e) {
    print(e.toString());
  }
}
