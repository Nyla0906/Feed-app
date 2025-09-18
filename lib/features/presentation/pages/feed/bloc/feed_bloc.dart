import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'feed_event.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(const FeedState()) {
    on<LoadFeedEvent>(_onLoadFeed);
    on<AddToFavouritesEvent>(_onAddToFavourites);
    on<RemoveFromFavouritesEvent>(_onRemoveFromFavourites);
  }

  Future<void> _onLoadFeed(LoadFeedEvent event, Emitter<FeedState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final url = Uri.parse(
        'https://feeds.feedburner.com/ndtvnews-top-stories',
      );
      final response = await http.get(url);

      final xml2json = Xml2Json();
      xml2json.parse(response.body);
      final jsonData = json.decode(xml2json.toGData());

      final items = List<Map<String, dynamic>>.from(
        jsonData['rss']['channel']['item'],
      );

      emit(state.copyWith(feedItems: items, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _onAddToFavourites(AddToFavouritesEvent event, Emitter<FeedState> emit) {
    final updated = List<Map<String, dynamic>>.from(state.favourites);

    final alreadyExists = updated.any(
      (fav) =>
          fav['title']?['__cdata'] == event.item['title']?['__cdata'] &&
          fav['pubDate']?['__cdata'] == event.item['pubDate']?['__cdata'],
    );

    if (!alreadyExists) {
      updated.add(event.item);
      emit(state.copyWith(favourites: updated));
    }
  }

  void _onRemoveFromFavourites(
    RemoveFromFavouritesEvent event,
    Emitter<FeedState> emit,
  ) {
    final updated = List<Map<String, dynamic>>.from(state.favourites)
      ..removeWhere(
        (fav) =>
            fav['title']?['__cdata'] == event.item['title']?['__cdata'] &&
            fav['pubDate']?['__cdata'] == event.item['pubDate']?['__cdata'],
      );

    emit(state.copyWith(favourites: updated));
  }
}
