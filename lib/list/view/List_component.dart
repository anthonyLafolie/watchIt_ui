// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/list/bloc/list_bloc.dart';
import 'package:watch_it/list/view/list_item.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, ListState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is ListLoadingState) {
          return const Flexible(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is ListLoadedState) {
          if (state.movies.isEmpty) {
            return const Flexible(
              child: Center(child: Text("Pas encore de film dans votre liste")),
            );
          }
          return SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 3,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                state.movies.length.clamp(0, 4),
                (index) => ListItem(
                  movie: state.movies.elementAt(index),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
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
        if (state is ListLoadingState) {
          return const Flexible(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is ListLoadedState) {
          if (state.movies.isEmpty) {
            return const Flexible(
              child: Center(child: Text("Pas encore de film dans votre liste")),
            );
          }
          return SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 3,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                state.movies.length.clamp(0, 4),
                (index) => ListItem(
                  movie: state.movies.elementAt(index),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
