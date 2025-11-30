import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int bottomIndex;
  final int gameModeIndex;

  const HomeState({
    this.bottomIndex = 0,
    this.gameModeIndex = 0,
  });

  HomeState copyWith({
    int? bottomIndex,
    int? gameModeIndex,
  }) {
    return HomeState(
      bottomIndex: bottomIndex ?? this.bottomIndex,
      gameModeIndex: gameModeIndex ?? this.gameModeIndex,
    );
  }

  @override
  List<Object?> get props => [bottomIndex, gameModeIndex];
}
