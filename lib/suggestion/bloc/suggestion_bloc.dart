import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/common/constant.dart';
import 'package:watch_it/model/filter.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/service/filter_service.dart';
import 'package:watch_it/service/lists_service.dart';
import 'package:watch_it/service/tmdb_service.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(const SuggestionState([], 1, 1, MODE.globalMode)) {
    on<SuggestionLoading>(_onSuggestionLoading);
    on<SuggestionLoaded>(_onSuggestionLoaded);
    on<AddWatchList>(_onAddWatchList);
    on<AddAlreadySeen>(_onAddAlreadySeenList);
    on<AddDontWant>(_onAddDontWantList);
  }

  void _onSuggestionLoading(
      SuggestionLoading event, Emitter<SuggestionState> emit) async {
    emit(SuggestionLoadingState());
    String? filtersString;
    if (event.mode == MODE.forYouMode) {
      filtersString = await getFiltersString();
    }
    await TmdbService()
        .getMovies(event.movies, event.page, filtersString)
        .then((value) {
      List<Movie> movies = copyList(event.movies);
      movies.addAll(value.first);
      emit(SuggestionLoadedState(
          movies, value.last, event.initialPoster, event.mode));
    });
  }

  void _onSuggestionLoaded(
      SuggestionLoaded event, Emitter<SuggestionState> emit) async {
    emit(SuggestionLoadedState(
        event.movies, event.page, event.initialPoster, event.mode));
  }

  void _onAddWatchList(
      AddWatchList event, Emitter<SuggestionState> emit) async {
    await ListsService().addMovieToWatchList(event.movies.first);
    manageList(event, emit);
  }

  void _onAddAlreadySeenList(
      AddAlreadySeen event, Emitter<SuggestionState> emit) async {
    await ListsService().addMovieToAlreadySeenList(event.movies.first);
    manageList(event, emit);
  }

  void _onAddDontWantList(
      AddDontWant event, Emitter<SuggestionState> emit) async {
    await ListsService().addMovieToDontWantSeenList(event.movies.first);
    manageList(event, emit);
  }

  void manageList(event, emit) {
    List<Movie> movies = copyList(state.movies);
    if (state.movies.indexOf(event.movies.first) == state.movies.length - 2) {
      add(SuggestionLoading(movies..remove(event.movies.first), state.page + 1,
          state.movies.indexOf(event.movies.first), state.mode));
    } else {
      emit(SuggestionLoadedState(movies..remove(event.movies.first), state.page,
          state.initialPoster, state.mode));
    }
  }

  Future<String> getFiltersString() async {
    return await FilterService().getFilters().then((filters) {
      String fArgument = "";
      for (FilterTmdb filter in filters) {
        if (filter.checked) {
          fArgument += filter.id.toString() + "|";
        }
      }
      return fArgument.isEmpty
          ? fArgument
          : fArgument.substring(0, fArgument.length - 1);
    });
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
