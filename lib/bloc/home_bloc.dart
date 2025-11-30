import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangeBottomNav>((event, emit) {
      emit(state.copyWith(bottomIndex: event.index));
    });

    on<ChangeGameMode>((event, emit) {
      emit(state.copyWith(gameModeIndex: event.tab));
    });
  }
}
