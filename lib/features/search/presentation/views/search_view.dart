import 'package:flutter/material.dart';
import 'package:weather_app/core/styles/styles.dart';
import 'package:weather_app/costants.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 32),
        centerTitle: true,
        title: Text(
          'Search',
          style: Styles.textStyle24
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: const SearchViewBody(),
    );
  }
}
