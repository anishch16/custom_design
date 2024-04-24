part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class CounterState extends HomePageState {
  final int count;
  final int dislike;
  final bool like;
  final bool dislikeBool;

  CounterState(this.count, this.like, this.dislike, this.dislikeBool);
}
