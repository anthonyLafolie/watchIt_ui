part of 'list_bloc.dart';

class ListState extends Equatable {
  final List<Movie> movies;
  const ListState(this.movies);

  @override
  List<Object> get props => [movies];
}

class ListLoadingState extends ListState {
  ListLoadingState() : super([]);
}

class ListLoadedState extends ListState {
  const ListLoadedState(List<Movie> movies) : super(movies);
}
