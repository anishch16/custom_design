part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class IncrementEvent extends HomePageEvent {}

class DecrementEvent extends HomePageEvent {}
