import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';

class CityLocationItem extends StatelessWidget {
  const CityLocationItem({
    super.key,
    required this.city,
    required this.country,
  });
  final String city, country;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.location_on_outlined,
            size: 32,
          ),
        ),
        Text(
          '$city' ',  ',
          style: Styles.textStyle24,
        ),
        Text(
          country,
          style: Styles.textStyle24,
        ),
      ],
    );
  }
}
