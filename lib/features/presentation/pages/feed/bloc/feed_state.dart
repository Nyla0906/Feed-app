import 'package:equatable/equatable.dart';

class FeedState extends Equatable {
  final List<Map<String, dynamic>> feedItems;
  final List<Map<String, dynamic>> favourites;
  final bool isLoading;
  final String? error;

  const FeedState({
    this.feedItems = const [],
    this.favourites = const [],
    this.isLoading = false,
    this.error,
  });

  FeedState copyWith({
    List<Map<String, dynamic>>? feedItems,
    List<Map<String, dynamic>>? favourites,
    bool? isLoading,
    String? error,
  }) {
    return FeedState(
      feedItems: feedItems ?? this.feedItems,
      favourites: favourites ?? this.favourites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [feedItems, favourites, isLoading, error];
}
