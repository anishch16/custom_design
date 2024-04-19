import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      final currentState = state as CounterState;

      emit(CounterState(currentState.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(currentState.count - 1));
    });
  }
}
