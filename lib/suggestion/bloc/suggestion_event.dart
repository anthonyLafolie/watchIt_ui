part of 'suggestion_bloc.dart';

class SuggestionEvent extends Equatable {
  final List<Movie> movies;
  final int page;
  final int initialPoster;
  const SuggestionEvent(this.movies, this.page, this.initialPoster);

  @override
  List<Object> get props => [movies, page];
}

class SuggestionLoading extends SuggestionEvent {
  const SuggestionLoading(List<Movie> movies, int page, int initialPoster)
      : super(movies, page, initialPoster);
}

class SuggestionLoaded extends SuggestionEvent {
  const SuggestionLoaded(List<Movie> movies, int page, int initialPoster)
      : super(movies, page, initialPoster);
}

class AddWatchList extends SuggestionEvent {
  AddWatchList(Movie movie) : super(List.filled(1, movie), 0, 0);
}

class AddAlreadySeen extends SuggestionEvent {
  AddAlreadySeen(Movie movie) : super(List.filled(1, movie), 0, 0);
}

class AddDontWant extends SuggestionEvent {
  AddDontWant(Movie movie) : super(List.filled(1, movie), 0, 0);
}
