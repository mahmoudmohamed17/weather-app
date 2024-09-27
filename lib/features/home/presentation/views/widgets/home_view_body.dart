import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/styles/styles.dart';
import 'package:weather_app/features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_app/features/home/presentation/views/widgets/hourly_forecase_list_view_item.dart';
import 'package:weather_app/features/home/presentation/views/widgets/weather_primary_data.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const Center(
            child: Text(
              textAlign: TextAlign.center,
              'There is no weather, start searching now 🔍',
              style: Styles.textStyle24,
            ),
          );
        } else if (state is WeatherSuccess) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                BlocProvider.of<WeatherCubit>(context).getThemeColor(),
                BlocProvider.of<WeatherCubit>(context).getThemeColor()[300]!,
                BlocProvider.of<WeatherCubit>(context).getThemeColor()[100]!,
              ]),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: WeatherPrimaryData(
                    weatherModel: state.weatherModel,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: HourlyForecaseListViewItem(
                    hours: state.weatherModel.forecast!.forecastday![0].hour!,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
              ],
            ),
          );
        } else if (state is WeatherFailure) {
          return Center(
            child: Text(
              textAlign: TextAlign.center,
              state.errorMsg,
              style: Styles.textStyle24,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
