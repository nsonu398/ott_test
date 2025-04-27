part of 'home_bloc.dart';


abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeContent extends HomeEvent {}

class RefreshHomeContent extends HomeEvent {}

class SelectCategory extends HomeEvent {
  final String category;

  const SelectCategory(this.category);

  @override
  List<Object> get props => [category];
}