import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/screen/list/bloc/list_bloc.dart';
import 'package:watch_it/screen/list/view/List_component.dart';

import 'movie_list_view.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WatchListBloc()..add(ListLoading()),
        ),
        BlocProvider(
          create: (context) => AlreadySeenListBloc()..add(ListLoading()),
        ),
      ],
      child: Column(
        children: [
          Expanded(flex: 1, child: Container()),
          const Expanded(
              flex: 3,
              child: MovieListView(
                listName: "watchList",
                widgetList: WatchList(),
              )),
          Expanded(flex: 1, child: Container()),
          const Expanded(
              flex: 3,
              child: MovieListView(
                listName: "Déjà vu",
                widgetList: AlreadySeenList(),
              )),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
