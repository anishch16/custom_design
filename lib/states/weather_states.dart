import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';
import '../model/weatheer_model.dart';

@immutable
abstract class WeatherState extends Equatable {}


class WeatherInitialState extends WeatherState {

  @override
  List<Object?> get props => throw UnimplementedError();
  final WeatherModel weather;
  // var value = "Something Useful";
  WeatherInitialState(this.weather);
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;
  WeatherLoadedState(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState(this.error);
  @override
  List<Object?> get props => [error];
}