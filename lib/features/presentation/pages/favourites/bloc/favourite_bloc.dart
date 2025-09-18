import 'package:flutter_bloc/flutter_bloc.dart';
import 'favourite_event.dart';
import 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(const FavouriteState()) {
    on<AddFavouriteEvent>((event, emit) {
      final updated = List<Map<String, dynamic>>.from(state.favourites)
        ..add(event.item);
      emit(state.copyWith(favourites: updated));
    });

    on<RemoveFavouriteEvent>((event, emit) {
      final updated = List<Map<String, dynamic>>.from(state.favourites)
        ..removeWhere(
              (e) => e['title']?['__cdata'] == event.item['title']?['__cdata'],
        );
      emit(state.copyWith(favourites: updated));
    });
  }
}
