// ignore_for_file: must_be_immutable

part of 'filter_bloc.dart';

class FilterState extends Equatable {
  List<FilterTmdb> filters;
  FilterState(this.filters);

  @override
  List<Object> get props => [filters];
}

class FilterLoadingState extends FilterState {
  FilterLoadingState() : super([]);
}

class FilterLoadedState extends FilterState {
  FilterLoadedState(List<FilterTmdb> filters) : super(filters);
}
