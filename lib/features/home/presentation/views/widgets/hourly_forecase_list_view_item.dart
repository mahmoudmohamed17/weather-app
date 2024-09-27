import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/weather_model/hour.dart';

import 'hourly_forecast_item.dart';

class HourlyForecaseListViewItem extends StatelessWidget {
  const HourlyForecaseListViewItem({super.key, required this.hours});
  final List<Hour> hours;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
        
        scrollDirection: Axis.horizontal,
        itemCount: hours.length, // 24
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: HourlyForecastItem(hour: hours[index],),
          );
        },
      ),
    );
  }
}
