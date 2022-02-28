import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/common/constant.dart';
import 'package:watch_it/screen/suggestion/bloc/suggestion_bloc.dart';
import 'package:watch_it/screen/suggestion/view/carousel_item.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SuggestionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SuggestionBloc()
          ..add(const SuggestionLoading([], 1, 0, MODE.globalMode));
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
                    enableInfiniteScroll: false,
                    initialPage: state.initialPoster,
                    onPageChanged: (index, reason) {
                      if (index + 1 >= state.movies.length) {
                        context.read<SuggestionBloc>().add(SuggestionLoading(
                            state.movies, state.page + 1, index, state.mode));
                      }
                    },
                  ),
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
