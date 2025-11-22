import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Search City', style: TextStyle()),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
              child: TextField(
            onSubmitted: (value) async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
              await BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 20.h,
              ),
              labelText: "Search",
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
          )),
        ));
  }
}
