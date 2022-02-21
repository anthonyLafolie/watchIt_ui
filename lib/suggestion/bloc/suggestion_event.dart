part of 'suggestion_bloc.dart';

class SuggestionEvent extends Equatable {
  final List<Movie> movies;

  const SuggestionEvent(this.movies);

  @override
  List<Object> get props => [movies];
}

class SuggestionLoading extends SuggestionEvent {
  SuggestionLoading() : super([]);
}

class SuggestionLoaded extends SuggestionEvent {
  const SuggestionLoaded(List<Movie> movies) : super(movies);
}

class AddWatchList extends SuggestionEvent {
  AddWatchList(Movie movie) : super(List.filled(1, movie));
}

class AddAlreadySeen extends SuggestionEvent {
  AddAlreadySeen(Movie movie) : super(List.filled(1, movie));
}

class AddDontWant extends SuggestionEvent {
  AddDontWant(Movie movie) : super(List.filled(1, movie));
}
