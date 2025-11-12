import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 25.sp),
        ),
      ),
      body: const NoWeatherBody(),
    );
  }
}
