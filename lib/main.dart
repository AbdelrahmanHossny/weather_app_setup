import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/wethermodel.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  // Wetherservice(Dio()).getWether(cityName: "cairo");
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => GetWeatherCubit(),
          child: Builder(
            builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) => MaterialApp(
                theme: ThemeData(
                    useMaterial3: false,
                    primarySwatch: themeColorForCondition(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition)),
                debugShowCheckedModeBanner: false,
                home: child,
              ),
            ),
          ),
        );
      },
      child: const HomeView(),
    );
  }
}

MaterialColor themeColorForCondition(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  condition = condition.toLowerCase();

  // ☀ Sunny / Clear
  if (condition.contains("sunny") || condition.contains("clear")) {
    return Colors.orange;
  }

  // ⛅ Cloudy
  if (condition.contains("cloudy") || condition.contains("overcast")) {
    return Colors.blueGrey;
  }

  // 🌫 Mist / Fog
  if (condition.contains("mist") ||
      condition.contains("fog") ||
      condition.contains("freezing fog")) {
    return Colors.grey;
  }

  // 🌧 Drizzle
  if (condition.contains("drizzle") || condition.contains("light rain")) {
    return Colors.lightBlue;
  }

  // 🌧 Moderate rain
  if (condition.contains("moderate rain")) {
    return Colors.blue;
  }

  // 🌧 Heavy rain
  if (condition.contains("heavy rain") || condition.contains("torrential")) {
    return Colors.indigo;
  }

  // ❄ Snow
  if (condition.contains("snow")) {
    return Colors.cyan;
  }

  // 🧊 Sleet / Ice
  if (condition.contains("sleet") ||
      condition.contains("freezing") ||
      condition.contains("ice pellets")) {
    return Colors.teal;
  }

  // 🌩 Thunder
  if (condition.contains("thunder")) {
    return Colors.deepPurple;
  }

  // Default color
  return Colors.blue;
}
