part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class IncrementEvent extends HomePageEvent {}

class DecrementEvent extends HomePageEvent {}

class IncrementEventDislike extends HomePageEvent {}

class DecrementEventDislike extends HomePageEvent {}

class LikeEvent extends HomePageEvent {}

class DisLikeEvent extends HomePageEvent {}
