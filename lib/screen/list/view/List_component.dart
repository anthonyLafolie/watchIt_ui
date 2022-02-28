// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/screen/list/bloc/list_bloc.dart';
import 'package:watch_it/screen/list/view/list_item.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, ListState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is ListLoadedState) {
          return BuildList(movies: state.movies);
        }
        return const Flexible(
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class AlreadySeenList extends StatelessWidget {
  const AlreadySeenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlreadySeenListBloc, ListState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is ListLoadedState) {
          return BuildList(movies: state.movies);
        }
        return const Flexible(
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class BuildList extends StatelessWidget {
  final List<Movie> movies;
  const BuildList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Flexible(
        child: Container(
          color: Colors.grey.shade500,
          child: const Center(
            child: Text("Pas encore de film dans votre liste"),
          ),
        ),
      );
    }
    return Container(
      color: Colors.grey.shade500,
      width: double.infinity,
      child: Wrap(
        spacing: 0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
          movies.length.clamp(0, 4),
          (index) => ListItem(
            movie: movies.elementAt(index),
          ),
        ),
      ),
    );
  }
}
