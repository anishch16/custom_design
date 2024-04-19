part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class CounterState extends HomePageState {
  final int count;

  CounterState(this.count);
}
