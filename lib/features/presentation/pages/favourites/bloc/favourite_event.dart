import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class AddFavouriteEvent extends FavouriteEvent {
  final Map<String, dynamic> item;
  const AddFavouriteEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveFavouriteEvent extends FavouriteEvent {
  final Map<String, dynamic> item;
  const RemoveFavouriteEvent(this.item);

  @override
  List<Object?> get props => [item];
}
