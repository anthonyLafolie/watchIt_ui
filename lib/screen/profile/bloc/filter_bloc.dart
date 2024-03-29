import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/service/filter_service.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState(const [], false)) {
    on<FilterLoading>(_onFilterLoading);
    on<FilterLoaded>(_onFilterLoaded);
    on<FilterUpdate>(_onFilterUpdate);
  }

  void _onFilterLoading(FilterLoading event, Emitter<FilterState> emit) async {
    emit(FilterLoadingState());
    await FilterService().getFilters().then((value) {
      emit(FilterLoadedState(value, false));
    });
  }

  void _onFilterLoaded(FilterLoaded event, Emitter<FilterState> emit) async {
    emit(FilterLoadedState(event.filters, false));
  }

  void _onFilterUpdate(FilterUpdate event, Emitter<FilterState> emit) async {
    try {
      await FilterService().updateFilters(event.filters);
      emit(FilterUpdatedState(event.filters, true));
    } catch (e) {
      emit(FilterUpdatedState(event.filters, false));
    }
  }
}
