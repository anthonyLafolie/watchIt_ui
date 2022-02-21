import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/suggestion/bloc/suggestion_bloc.dart';
import 'package:watch_it/suggestion/view/carousel_item.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SuggestionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SuggestionBloc()..add(SuggestionLoading());
      },
      child: BlocBuilder<SuggestionBloc, SuggestionState>(
          buildWhen: (previous, current) => previous.movies != current.movies,
          builder: (context, state) {
            if (state is SuggestionLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SuggestionLoadedState) {
              return CarouselSlider(
                  options: CarouselOptions(
                      height: double.infinity,
                      scrollDirection: Axis.vertical,
                      viewportFraction: 1,
                      enableInfiniteScroll: false),
                  items: state.movies
                      .map((e) => CarouselItem(
                            movie: e,
                          ))
                      .toList());
            }
            return Container();
          }),
    );
  }
}
