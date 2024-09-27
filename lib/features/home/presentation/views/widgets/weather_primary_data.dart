import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/weather_model/weather_model.dart';

import '../../../../../core/styles/styles.dart';
import 'city_location_item.dart';
import 'weather_info_item.dart';

class WeatherPrimaryData extends StatelessWidget {
  const WeatherPrimaryData({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        const SizedBox(
          height: 40,
        ),
        CachedNetworkImage(
            fit: BoxFit.cover,
            height: 90,
            width: 90,
            errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
            placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
            imageUrl: 'https:${weatherModel.current!.condition!.icon}'),
        const SizedBox(
          height: 40,
        ),
        Text(
          textAlign: TextAlign.center,
          weatherModel.current!.condition!.text!,
          style: Styles.textStyle36,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          '${weatherModel.current!.tempC}' '°C',
          style: Styles.textStyle36,
        ),
        const SizedBox(
          height: 15,
        ),
        CityLocationItem(
          city: weatherModel.location!.name!,
          country: weatherModel.location!.country!,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeatherInfoItem(
              filed: 'Wind',
              icon: Icons.air,
              value: '${weatherModel.current!.windMph.toString()}mgh',
            ),
            WeatherInfoItem(
              filed: 'Humidity',
              icon: Icons.water_drop_sharp,
              value: '${weatherModel.current!.humidity.toString()}%',
            ),
            WeatherInfoItem(
              filed: 'UV Index',
              icon: Icons.sunny,
              value: weatherModel.current!.uv.toString(),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hourly forecast',
            style: Styles.textStyle20,
          ),
        ),
      ]),
    );
  }
}
