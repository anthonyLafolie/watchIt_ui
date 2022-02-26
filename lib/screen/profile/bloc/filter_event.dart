// ignore_for_file: must_be_immutable

part of 'filter_bloc.dart';

class FilterEvent extends Equatable {
  List<FilterTmdb> filters;

  FilterEvent(this.filters);

  @override
  List<Object> get props => [filters];
}

class FilterLoading extends FilterEvent {
  FilterLoading() : super([]);
}

class FilterLoaded extends FilterEvent {
  FilterLoaded(List<FilterTmdb> filters) : super(filters);
}

class FilterUpdate extends FilterEvent {
  FilterUpdate(List<FilterTmdb> filters) : super(filters);
}
