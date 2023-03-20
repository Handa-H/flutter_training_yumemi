import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @JsonKey(name: 'weather_condition')
  final String weatherCondition;
  @JsonKey(name: 'max_temperature')
  final int maxTemperature;
  @JsonKey(name: 'min_temperature')
  final int minTemperature;
  final DateTime date;
}
