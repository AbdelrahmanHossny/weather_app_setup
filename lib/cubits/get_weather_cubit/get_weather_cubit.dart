import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/wethermodel.dart';
import 'package:weather_app/service/wetherService.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await Wetherservice(Dio()).getWether(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
      print(e);
    }
  }
}
