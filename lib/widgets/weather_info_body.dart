import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeColorForCondition(weatherModel.weatherCondition),
            themeColorForCondition(weatherModel.weatherCondition)[300]!,
            themeColorForCondition(weatherModel.weatherCondition)[50]!
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityname!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
            Text(
              '${weatherModel.date!.hour}:${weatherModel.date!.minute}',
              style: TextStyle(
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image!}',
                  fit: BoxFit.cover,
                  width: 80.w,
                  height: 80.h,
                ),
                Text(
                  '${weatherModel.temp!.round()}°C',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp!.round()}',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp!.round()}',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              weatherModel.weatherCondition!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
