part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final Movie? movie;
  const MovieDetailState(this.movieDetail, this.movie);

  @override
  List<Object> get props => [movieDetail!, movie!];
}

class MovieDetailLoadingState extends MovieDetailState {
  const MovieDetailLoadingState(Movie movie) : super(null, movie);
}

class MovieDetailLoadedState extends MovieDetailState {
  const MovieDetailLoadedState(MovieDetail movieDetail, Movie movie)
      : super(movieDetail, movie);
}
