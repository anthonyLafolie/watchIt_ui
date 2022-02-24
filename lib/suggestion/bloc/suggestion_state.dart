part of 'suggestion_bloc.dart';

class SuggestionState extends Equatable {
  final List<Movie> movies;
  final int page;
  final int initialPoster;
  const SuggestionState(this.movies, this.page, this.initialPoster);

  @override
  List<Object> get props => [movies, page, initialPoster];
}

class SuggestionLoadingState extends SuggestionState {
  SuggestionLoadingState() : super([], 1, 1);
}

class SuggestionLoadedState extends SuggestionState {
  const SuggestionLoadedState(List<Movie> movies, int page, int initialPoster)
      : super(movies, page, initialPoster);
}
