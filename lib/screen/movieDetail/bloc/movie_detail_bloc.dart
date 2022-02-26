import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/model/movie_detail.dart';
import 'package:watch_it/service/tmdb_service.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(const MovieDetailState(null, null)) {
    on<MovieDetailLoading>(_onMovieDetailLoading);
    on<MovieDetailLoaded>(_onMovieDetailLoaded);
  }

  void _onMovieDetailLoading(
      MovieDetailLoading event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoadingState(event.movie));
    await TmdbService().getMovieInfo(event.movie).then(
        (movieInfo) => emit(MovieDetailLoadedState(movieInfo, event.movie)));
  }

  void _onMovieDetailLoaded(
      MovieDetailLoaded event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoadedState(event.movieDetail!, event.movie));
  }
}
