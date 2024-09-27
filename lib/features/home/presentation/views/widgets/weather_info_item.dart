import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';

class WeatherInfoItem extends StatelessWidget {
  const WeatherInfoItem({super.key, required this.filed, required this.icon, required this.value});
  final String filed;
  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.25,
      child:  Card(
        shadowColor: Colors.black,
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              filed,
              style: Styles.textStyle16,
            ),
            Icon(
              icon,
              size: 27,
            ),
            Text(
              value,
              style: Styles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
