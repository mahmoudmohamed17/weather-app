import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/styles/styles.dart';
import 'package:weather_app/core/utilities/functions/time_handler.dart';
import 'package:weather_app/features/home/data/models/weather_model/hour.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key, required this.hour});
  final Hour hour;
  @override
  Widget build(BuildContext context) {
    String time = hour.time!.substring(11, 13);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        shadowColor: Colors.black,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                timeHandler(time),
                style: Styles.textStyle16,
              ),
              CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 24,
                  width: 24,
                  errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 32,
                      ),
                  placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  imageUrl: 'https:${hour.condition!.icon}'),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                hour.condition!.text!,
                style: Styles.textStyle16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
