import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.blue,
          title:
              const Text('Search City', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
              child: TextField(
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
              suffixIcon: Icon(Icons.search),
            ),
          )),
        ));
  }
}
