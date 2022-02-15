import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/service/tmdb_service.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(const SuggestionState([])) {
    on<SuggestionLoading>(_onSuggestionLoading);
    on<SuggestionLoaded>(_onSuggestionLoaded);
    on<AddWatchList>(_onAddWatchList);
    on<AddAlreadySeen>(_onAddAlreadySeen);
    on<AddDontWant>(_onAddDontWant);
  }

  void _onSuggestionLoading(
      SuggestionLoading event, Emitter<SuggestionState> emit) async {
    emit(SuggestionLoadingState());
    await TmdbService().getMovies().then((value) {
      emit(SuggestionLoadedState(value));
    });
  }

  void _onSuggestionLoaded(
      SuggestionLoaded event, Emitter<SuggestionState> emit) async {
    emit(SuggestionLoadedState(event.movies));
  }

  void _onAddWatchList(
      AddWatchList event, Emitter<SuggestionState> emit) async {
    List<Movie> movies = copyList(state.movies);
    emit(SuggestionLoadedState(movies..remove(event.movies.first)));
  }

  void _onAddAlreadySeen(
      AddAlreadySeen event, Emitter<SuggestionState> emit) async {
    List<Movie> movies = copyList(state.movies);
    emit(SuggestionLoadedState(movies..remove(event.movies.first)));
  }

  void _onAddDontWant(AddDontWant event, Emitter<SuggestionState> emit) async {
    List<Movie> movies = copyList(state.movies);
    emit(SuggestionLoadedState(movies..remove(event.movies.first)));
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
