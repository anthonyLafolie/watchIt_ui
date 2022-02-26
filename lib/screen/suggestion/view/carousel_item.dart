import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/common/constant.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/screen/suggestion/bloc/suggestion_bloc.dart';

class CarouselItem extends StatelessWidget {
  final Movie movie;
  const CarouselItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w780${movie.posterPath}",
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(
                height: 100,
                child: SuggestionMode(),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BorderedText(
                            strokeWidth: 5.0,
                            strokeJoin: StrokeJoin.round,
                            strokeColor: Colors.black,
                            child: Text(
                              movie.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(shadows: [
                                Shadow(blurRadius: 12, color: Colors.black)
                              ], color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 15),
                          BorderedText(
                            strokeWidth: 5.0,
                            strokeColor: Colors.black,
                            child: Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    context
                                        .read<SuggestionBloc>()
                                        .add(AddWatchList(movie));
                                  },
                                  child: const Icon(Icons.list,
                                      color: Colors.black),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Colors.white,
                                    onPrimary: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SuggestionBloc>()
                                        .add(AddAlreadySeen(movie));
                                  },
                                  child: const Icon(Icons.remove_red_eye,
                                      color: Colors.black),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Colors.white,
                                    onPrimary: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Center(
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SuggestionBloc>()
                                        .add(AddDontWant(movie));
                                  },
                                  child: const Icon(Icons.close_sharp,
                                      color: Colors.black),
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Colors.white,
                                    onPrimary: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SuggestionMode extends StatelessWidget {
  const SuggestionMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: BorderedText(
            strokeWidth: 5.0,
            strokeJoin: StrokeJoin.round,
            strokeColor: Colors.black,
            child: Text(
              "Global",
              style: TextStyle(
                color:
                    context.read<SuggestionBloc>().state.mode == MODE.globalMode
                        ? Colors.white
                        : Colors.grey,
              ),
            ),
          ),
          onTap: () {
            if (context.read<SuggestionBloc>().state.mode != MODE.globalMode) {
              context
                  .read<SuggestionBloc>()
                  .add(const SuggestionLoading([], 1, 0, MODE.globalMode));
            }
          },
        ),
        const SizedBox(width: 20),
        InkWell(
          child: BorderedText(
            strokeWidth: 5.0,
            strokeJoin: StrokeJoin.round,
            strokeColor: Colors.black,
            child: Text(
              "Pour vous",
              style: TextStyle(
                color:
                    context.read<SuggestionBloc>().state.mode == MODE.forYouMode
                        ? Colors.white
                        : Colors.grey,
              ),
            ),
          ),
          onTap: () {
            if (context.read<SuggestionBloc>().state.mode != MODE.forYouMode) {
              context
                  .read<SuggestionBloc>()
                  .add(const SuggestionLoading([], 1, 0, MODE.forYouMode));
            }
          },
        )
      ],
    );
  }
}
