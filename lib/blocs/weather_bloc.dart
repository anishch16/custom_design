import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/weather_event.dart';
import '../repository/repo.dart';
import '../states/weather_states.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final UserRepository _userRepository;
  late Timer _timer;

  WeatherBloc(this._userRepository) : super(WeatherLoadingState()) {
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        // final weather = await _userRepository.getWeather();
        // emit(WeatherLoadedState(weather));
        _startTimer();
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (_) async {
      try {
        final weather = await _userRepository.getWeather();
        emit(WeatherLoadedState(weather));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}
