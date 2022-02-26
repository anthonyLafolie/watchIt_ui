part of 'suggestion_bloc.dart';

class SuggestionEvent extends Equatable {
  final List<Movie> movies;
  final int page;
  final int initialPoster;
  final MODE mode;
  const SuggestionEvent(this.movies, this.page, this.initialPoster, this.mode);

  @override
  List<Object> get props => [movies, page, initialPoster, mode];
}

class SuggestionLoading extends SuggestionEvent {
  const SuggestionLoading(
      List<Movie> movies, int page, int initialPoster, MODE mode)
      : super(movies, page, initialPoster, mode);
}

class SuggestionLoaded extends SuggestionEvent {
  const SuggestionLoaded(
      List<Movie> movies, int page, int initialPoster, MODE mode)
      : super(movies, page, initialPoster, mode);
}

class AddWatchList extends SuggestionEvent {
  AddWatchList(Movie movie) : super(List.filled(1, movie), 0, 0, MODE.none);
}

class AddAlreadySeen extends SuggestionEvent {
  AddAlreadySeen(Movie movie) : super(List.filled(1, movie), 0, 0, MODE.none);
}

class AddDontWant extends SuggestionEvent {
  AddDontWant(Movie movie) : super(List.filled(1, movie), 0, 0, MODE.none);
}
