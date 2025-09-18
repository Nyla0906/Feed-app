import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object?> get props => [];
}

class LoadFeedEvent extends FeedEvent {}

class AddToFavouritesEvent extends FeedEvent {
  final Map<String, dynamic> item;

  const AddToFavouritesEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveFromFavouritesEvent extends FeedEvent {
  final Map<String, dynamic> item;

  const RemoveFromFavouritesEvent(this.item);

  @override
  List<Object?> get props => [item];
}
