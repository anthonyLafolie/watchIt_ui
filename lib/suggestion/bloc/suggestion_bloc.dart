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
    List<Movie> movies = state.movies
        .map((e) => Movie(
            id: e.id,
            overview: e.overview,
            posterPath: e.posterPath,
            title: e.title))
        .toList();
    emit(SuggestionLoadedState(movies..remove(event.movies.first)));
  }
}