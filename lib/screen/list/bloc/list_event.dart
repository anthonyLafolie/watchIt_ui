part of 'list_bloc.dart';

class ListEvent extends Equatable {
  final List<Movie> movies;

  const ListEvent(this.movies);

  @override
  List<Object> get props => [movies];
}

class ListLoading extends ListEvent {
  ListLoading() : super([]);
}

class ListLoaded extends ListEvent {
  const ListLoaded(List<Movie> movies) : super(movies);
}
