import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/utilities/app_router.dart';
import 'package:weather_app/features/home/data/repos/home_repo_impl.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_cubit.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(HomeRepoImpl()),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch:
                  BlocProvider.of<WeatherCubit>(context).weatherModel == null
                      ? Colors.blue
                      : BlocProvider.of<WeatherCubit>(context).getThemeColor(),
              textTheme:
                  GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
            ),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
