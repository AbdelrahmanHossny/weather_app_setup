import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no weather 😔 start',
              style: TextStyle(
                fontSize: 25.sp,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 25.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
