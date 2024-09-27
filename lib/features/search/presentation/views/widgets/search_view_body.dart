import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/styles/styles.dart';
import 'package:weather_app/costants.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    String? city;
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor,
              Colors.white,
            ]),
      ),
      padding: const  EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      child: TextField(
        onSubmitted: (value) {
          city = value;
        },
        style: Styles.textStyle20,
        decoration: InputDecoration(
          
          hintText: 'Enter city name',
          hintStyle: Styles.textStyle20.copyWith(color: Colors.grey),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeatherData(city: city!);
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 27,
                  color: Colors.black,
                )),
          ),
          filled: true,
          fillColor: const Color(0xffD9D9D9),
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(32)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );
  }
}
