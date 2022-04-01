import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String weatherUrl;
  NetworkHelper(this.weatherUrl);
  Future getData() async {
    var url = Uri.parse(weatherUrl);
    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var decodedData = jsonDecode(jsonData);
      return decodedData;
    } else {
      print('Response status: ${response.statusCode}');
    }
  }
}
