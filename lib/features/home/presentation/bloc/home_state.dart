part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TopicFailureState extends HomeState {
  final String error;

  TopicFailureState(this.error);
}

class AllTopicsDisplaySuccessState extends HomeState {
  final List<Topic> topics;

  AllTopicsDisplaySuccessState(this.topics);
}

class AllTopicsLoadingState extends HomeState {}
