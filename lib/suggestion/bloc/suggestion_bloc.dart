import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/service/lists_service.dart';
import 'package:watch_it/service/tmdb_service.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(const SuggestionState([], 1, 1)) {
    on<SuggestionLoading>(_onSuggestionLoading);
    on<SuggestionLoaded>(_onSuggestionLoaded);
    on<AddWatchList>(_onAddWatchList);
    on<AddAlreadySeen>(_onAddAlreadySeen);
    on<AddDontWant>(_onAddDontWant);
  }

  void _onSuggestionLoading(
      SuggestionLoading event, Emitter<SuggestionState> emit) async {
    emit(SuggestionLoadingState());
    await TmdbService().getMovies(event.page).then((value) {
      List<Movie> movies = copyList(event.movies);
      movies.addAll(value);
      emit(SuggestionLoadedState(movies, event.page, event.initialPoster));
    });
  }

  void _onSuggestionLoaded(
      SuggestionLoaded event, Emitter<SuggestionState> emit) async {
    emit(SuggestionLoadedState(event.movies, event.page, event.initialPoster));
  }

  void _onAddWatchList(
      AddWatchList event, Emitter<SuggestionState> emit) async {
    await ListsService().addMovieToWatchList(event.movies.first);
    List<Movie> movies = copyList(state.movies);
    emit(SuggestionLoadedState(
        movies..remove(event.movies.first), state.page, state.initialPoster));
  }

  void _onAddAlreadySeen(
      AddAlreadySeen event, Emitter<SuggestionState> emit) async {
    await ListsService().addMovieToAlreadySeenList(event.movies.first);
    List<Movie> movies = copyList(state.movies);
    emit(SuggestionLoadedState(
        movies..remove(event.movies.first), state.page, state.initialPoster));
  }

  void _onAddDontWant(AddDontWant event, Emitter<SuggestionState> emit) async {
    await ListsService().addMovieToDontWantSeenList(event.movies.first);
    List<Movie> movies = copyList(state.movies);
    emit(SuggestionLoadedState(
        movies..remove(event.movies.first), state.page, state.initialPoster));
  }

  List<Movie> copyList(List<Movie> moviesToCopy) {
    List<Movie> movies = moviesToCopy
        .map((e) => Movie(
            id: e.id,
            overview: e.overview,
            posterPath: e.posterPath,
            title: e.title))
        .toList();
    return movies;
  }
}
