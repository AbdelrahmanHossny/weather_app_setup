import 'package:dio/dio.dart';
import 'package:weather_app/models/wethermodel.dart';

class Wetherservice {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "key=28daa12d834240949de131347241103";
  Wetherservice(this.dio);
  Future<WeatherModel?> getWether({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      print(response.data);
      return weatherModel;
    } catch (e) {
      return null;
    }
  }
}
