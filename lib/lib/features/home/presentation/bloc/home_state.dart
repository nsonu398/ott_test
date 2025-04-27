part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeRefreshing extends HomeState {
  final List<ContentEntity> trendingContent;
  final String selectedCategory;

  const HomeRefreshing({
    required this.trendingContent,
    required this.selectedCategory,
  });

  @override
  List<Object> get props => [trendingContent, selectedCategory];
}

class HomeLoaded extends HomeState {
  final List<ContentEntity> trendingContent;
  final String selectedCategory;

  const HomeLoaded({
    required this.trendingContent,
    required this.selectedCategory,
  });

  @override
  List<Object> get props => [trendingContent, selectedCategory];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}