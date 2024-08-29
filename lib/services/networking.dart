import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    // get(
    //     'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b3076fae22');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      log(response.statusCode.toString());
    }
  }
}
