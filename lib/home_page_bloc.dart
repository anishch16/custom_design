import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(CounterState(0, false, 0, false)) {
    on<IncrementEvent>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(
          currentState.count + 1, currentState.like, currentState.dislike,currentState.dislikeBool));
    });

    on<DecrementEvent>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(
          currentState.count - 1, currentState.like, currentState.dislike,currentState.dislikeBool));
    });
    on<IncrementEventDislike>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(
          currentState.count, currentState.like, currentState.dislike + 1,currentState.dislikeBool));
    });
    on<DecrementEventDislike>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(
          currentState.count, currentState.like, currentState.dislike - 1,currentState.dislikeBool));
    });
    on<LikeEvent>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(currentState.count, !currentState.like, currentState.dislike,currentState.dislikeBool));
    });
    on<DisLikeEvent>((event, emit) {
      final currentState = state as CounterState;
      emit(CounterState(currentState.count, currentState.like, currentState.dislike, !currentState.dislikeBool));
    });
  }
}
