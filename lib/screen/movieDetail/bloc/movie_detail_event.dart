part of 'movie_detail_bloc.dart';

class MovieDetailEvent extends Equatable {
  final MovieDetail? movieDetail;
  final Movie movie;
  const MovieDetailEvent(this.movieDetail, this.movie);

  @override
  List<Object> get props => [movieDetail!, movie];
}

class MovieDetailLoading extends MovieDetailEvent {
  const MovieDetailLoading(Movie movie) : super(null, movie);
}

class MovieDetailLoaded extends MovieDetailEvent {
  const MovieDetailLoaded(MovieDetail movieDetail, Movie movie)
      : super(movieDetail, movie);
}
