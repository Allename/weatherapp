import "package:http/http.dart" as http;
import "../config/config.dart";
import "dart:convert";

class WeatherAPI {
  fetch(String cityname) async {
    final url = BASE_URL + "?q=" + cityname + "appid=" + API_KEY;

    print(url);

    try {
      final request = await http.get(url);
      final requestbody = await json.decode(request.body);

      print(requestbody);

      switch (requestbody.statusCode) {
        case 200:
          return requestbody;
        default:
          print("error");
      }
    } catch (err) {
      print(err);
      throw (err.toString());
    }
  }
}
