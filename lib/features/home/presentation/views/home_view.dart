import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/styles/styles.dart';
import 'package:weather_app/core/utilities/app_router.dart';
import 'package:weather_app/features/home/presentation/views/widgets/home_view_body.dart';
import '../manager/weather_cubit/weather_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSearchView);
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor:
                BlocProvider.of<WeatherCubit>(context).weatherModel == null
                    ? Colors.blue
                    : BlocProvider.of<WeatherCubit>(context).getThemeColor(),
            titleTextStyle: Styles.textStyle20,
            title: const Text(
              'Weather App',
            ),
          ),
          body: const HomeViewBody(),
        );
      },
    );
  }
}
