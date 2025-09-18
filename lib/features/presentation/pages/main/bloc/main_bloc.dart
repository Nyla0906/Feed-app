import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
