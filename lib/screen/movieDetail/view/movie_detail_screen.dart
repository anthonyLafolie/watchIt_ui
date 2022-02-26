import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/screen/movieDetail/bloc/movie_detail_bloc.dart';
import 'package:watch_it/screen/movieDetail/view/header/movie_detail_header.dart';
import 'package:watch_it/screen/movieDetail/view/overview.dart';

import 'casting.dart';
import 'categories.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  static Route route(Movie movie) {
    return MaterialPageRoute<void>(
        builder: (_) => MovieDetailScreen(movie: movie));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieDetailBloc()..add(MovieDetailLoading(movie));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: const SingleChildScrollView(
          child: MovieDetailview(),
        ),
      ),
    );
  }
}

class MovieDetailview extends StatelessWidget {
  const MovieDetailview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is MovieDetailLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieDetailLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieDetailHeader(movieDetail: state.movieDetail!),
                Categories(movieDetail: state.movieDetail!),
                Overview(movieDetail: state.movieDetail!),
                Casting(movieDetail: state.movieDetail!)
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
