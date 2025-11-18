import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/wethermodel.dart';

class Wetherservice {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "key=28daa12d834240949de131347241103";
  Wetherservice(this.dio);
  Future<WeatherModel> getWether({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      // print(weatherModel.cityname);
      return weatherModel;
    } on DioException catch (e) {
      log(e.toString());
      final String errormessage = e.response?.data['error']['message'] ??
          "there was an error , please try again later";
      throw Exception(errormessage);
    } catch (e) {
      throw Exception("there was an error , please try again later");
    }
  }
}
