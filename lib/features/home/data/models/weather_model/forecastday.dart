import 'package:equatable/equatable.dart';

import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class Forecastday extends Equatable {
  final String? date;
  final num? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Hour>? hour;

  const Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json['date'] as String?,
        dateEpoch: json['date_epoch'] as int?,
        day: json['day'] == null
            ? null
            : Day.fromJson(json['day'] as Map<String, dynamic>),
        astro: json['astro'] == null
            ? null
            : Astro.fromJson(json['astro'] as Map<String, dynamic>),
        hour: (json['hour'] as List<dynamic>?)
            ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day?.toJson(),
        'astro': astro?.toJson(),
        'hour': hour?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [date, dateEpoch, day, astro, hour];
}
