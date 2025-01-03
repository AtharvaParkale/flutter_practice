import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/core/common/entities/topic.dart';
import 'package:flutter_practice/core/usecase/usecase.dart';
import 'package:flutter_practice/features/home/domain/usecases/all_topics.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AllTopics _allTopics;

  HomeBloc({
    required AllTopics allTopics,
  })  : _allTopics = allTopics,
        super(HomeInitial()) {
    on<GetAllTopicsEvent>(_onGetAllTopicsEvent);
  }

  void _onGetAllTopicsEvent(
    GetAllTopicsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(AllTopicsLoadingState());
    final res = await _allTopics(NoParams());

    res.fold(
      (l) => emit(TopicFailureState(l.message)),
      (r) => emit(AllTopicsDisplaySuccessState(r)),
    );
  }
}
