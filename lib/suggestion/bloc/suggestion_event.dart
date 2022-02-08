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
