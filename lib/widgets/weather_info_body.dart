import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Alexandria',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
          ),
          Text(
            'updated at 23:46',
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
              Image.asset(
                'assets/images/cloudy.png',
              ),
              Text(
                '17',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.sp,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: 24',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Mintemp: 16',
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
            'Ligh Rain',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
          ),
        ],
      ),
    );
  }
}
