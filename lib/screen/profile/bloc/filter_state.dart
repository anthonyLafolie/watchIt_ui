// ignore_for_file: must_be_immutable

part of 'filter_bloc.dart';

class FilterState extends Equatable {
  List<FilterTmdb> filters;
  bool updateSucess;
  FilterState(this.filters, this.updateSucess);

  @override
  List<Object> get props => [filters, updateSucess];
}

class FilterLoadingState extends FilterState {
  FilterLoadingState() : super([], false);
}

class FilterLoadedState extends FilterState {
  FilterLoadedState(List<FilterTmdb> filters, bool updateSucess)
      : super(filters, updateSucess);
}

class FilterUpdatedState extends FilterState {
  FilterUpdatedState(List<FilterTmdb> filters, bool updateSucess)
      : super(filters, updateSucess);
}
