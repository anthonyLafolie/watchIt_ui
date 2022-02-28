part of 'suggestion_bloc.dart';

class SuggestionState extends Equatable {
  final List<Movie> movies;
  final int page;
  final int initialPoster;
  final MODE mode;
  const SuggestionState(this.movies, this.page, this.initialPoster, this.mode);

  @override
  List<Object> get props => [movies, page, initialPoster, mode];
}

class SuggestionLoadingState extends SuggestionState {
  SuggestionLoadingState() : super([], 1, 1, MODE.none);
}

class SuggestionLoadedState extends SuggestionState {
  const SuggestionLoadedState(
      List<Movie> movies, int page, int initialPoster, MODE mode)
      : super(movies, page, initialPoster, mode);
}
