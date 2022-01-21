part of 'home_cubit.dart';

enum HomeTab { suggestion, search, watchlist, profile }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.suggestion,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
