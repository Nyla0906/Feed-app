import 'package:equatable/equatable.dart';

class FavouriteState extends Equatable {
  final List<Map<String, dynamic>> favourites;

  const FavouriteState({this.favourites = const []});

  FavouriteState copyWith({List<Map<String, dynamic>>? favourites}) {
    return FavouriteState(favourites: favourites ?? this.favourites);
  }

  @override
  List<Object?> get props => [favourites];
}
