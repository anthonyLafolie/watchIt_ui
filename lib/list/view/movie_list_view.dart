import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_it/list/bloc/list_bloc.dart';
import 'package:watch_it/list/view/List_component.dart';
import 'package:watch_it/listDetail/view/list_detail_screen.dart';
import 'package:watch_it/model/movie.dart';

class MovieListView extends StatelessWidget {
  final String listName;
  final Widget widgetList;
  const MovieListView(
      {Key? key, required this.listName, required this.widgetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              InkWell(
                child: const Text("Voir Plus >"),
                onTap: () {
                  List<Movie> movies = [];
                  if (widgetList is WatchList) {
                    movies = context.read<WatchListBloc>().state.movies;
                  } else {
                    movies = context.read<AlreadySeenListBloc>().state.movies;
                  }
                  Navigator.push(context, ListDetailScreen.route(movies))
                      .then((value) {
                    context.read<WatchListBloc>().add(ListLoading());
                    context.read<AlreadySeenListBloc>().add(ListLoading());
                  });
                },
              ),
            ],
          ),
        ),
        widgetList,
      ],
    );
  }
}
