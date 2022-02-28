import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/service/lists_service.dart';

part 'list_event.dart';
part 'list_state.dart';

class WatchListBloc extends Bloc<ListEvent, ListState> {
  WatchListBloc() : super(const ListState([])) {
    on<ListLoading>(_onListLoading);
    on<ListLoaded>(_onListLoaded);
  }

  void _onListLoading(ListLoading event, Emitter<ListState> emit) async {
    emit(ListLoadingState());
    await ListsService().getWatchList().then((value) {
      emit(ListLoadedState(value));
    });
  }

  void _onListLoaded(ListLoaded event, Emitter<ListState> emit) async {
    emit(ListLoadedState(event.movies));
  }
}

class AlreadySeenListBloc extends Bloc<ListEvent, ListState> {
  AlreadySeenListBloc() : super(const ListState([])) {
    on<ListLoading>(_onListLoading);
    on<ListLoaded>(_onListLoaded);
  }

  void _onListLoading(ListLoading event, Emitter<ListState> emit) async {
    emit(ListLoadingState());
    await ListsService().getAlreadySeenList().then((value) {
      emit(ListLoadedState(value));
    });
  }

  void _onListLoaded(ListLoaded event, Emitter<ListState> emit) async {
    emit(ListLoadedState(event.movies));
  }
}
