// lib/features/home/presentation/bloc/home_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/content_entity.dart';
import '../../domain/usecases/get_trending_content.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTrendingContent getTrendingContent;

  HomeBloc({required this.getTrendingContent}) : super(HomeInitial()) {
    on<LoadHomeContent>(_onLoadHomeContent);
    on<RefreshHomeContent>(_onRefreshHomeContent);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onLoadHomeContent(
      LoadHomeContent event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());

    final trendingResult = await getTrendingContent();

    trendingResult.fold(
          (failure) => emit(HomeError(message: failure.message)),
          (content) => emit(HomeLoaded(
        trendingContent: content,
        selectedCategory: 'All',
      )),
    );
  }

  Future<void> _onRefreshHomeContent(
      RefreshHomeContent event,
      Emitter<HomeState> emit,
      ) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(HomeRefreshing(
        trendingContent: currentState.trendingContent,
        selectedCategory: currentState.selectedCategory,
      ));

      final trendingResult = await getTrendingContent();

      trendingResult.fold(
            (failure) => emit(HomeError(message: failure.message)),
            (content) => emit(HomeLoaded(
          trendingContent: content,
          selectedCategory: currentState.selectedCategory,
        )),
      );
    } else {
      add(LoadHomeContent());
    }
  }

  void _onSelectCategory(
      SelectCategory event,
      Emitter<HomeState> emit,
      ) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(HomeLoaded(
        trendingContent: currentState.trendingContent,
        selectedCategory: event.category,
      ));
    }
  }
}


