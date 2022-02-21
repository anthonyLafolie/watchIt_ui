part of 'suggestion_bloc.dart';

class SuggestionState extends Equatable {
  final List<Movie> movies;
  const SuggestionState(this.movies);

  @override
  List<Object> get props => [movies];
}

class SuggestionLoadingState extends SuggestionState {
  SuggestionLoadingState() : super([]);
}

class SuggestionLoadedState extends SuggestionState {
  const SuggestionLoadedState(List<Movie> movies) : super(movies);
}
