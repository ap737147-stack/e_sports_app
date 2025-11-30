import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeBottomNav extends HomeEvent {
  final int index;
  const ChangeBottomNav(this.index);

  @override
  List<Object?> get props => [index];
}

class ChangeGameMode extends HomeEvent {
  final int tab;
  const ChangeGameMode(this.tab);

  @override
  List<Object?> get props => [tab];
}
