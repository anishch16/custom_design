import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/weather_event.dart';
import '../repository/repo.dart';
import '../states/weather_states.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final UserRepository _userRepository;

  WeatherBloc(this._userRepository) : super(WeatherLoadingState()) {
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherInitialState(await _userRepository.getWeather()));
      emit(WeatherLoadingState());
      try {
        final weather = await _userRepository.getWeather();
        emit(WeatherLoadedState(weather));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}
