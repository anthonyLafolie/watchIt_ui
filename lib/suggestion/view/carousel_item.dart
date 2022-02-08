import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/model/movie.dart';

class CarouselItem extends StatelessWidget {
  final Movie movie;
  const CarouselItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/original${movie.posterPath}",
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
        Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BorderedText(
                    strokeWidth: 5.0,
                    strokeJoin: StrokeJoin.round,
                    strokeColor: Colors.black,
                    child: const Text("Global"),
                  ),
                  const SizedBox(width: 20),
                  BorderedText(
                    strokeWidth: 5.0,
                    strokeJoin: StrokeJoin.round,
                    strokeColor: Colors.black,
                    child: const Text("Pour vous"),
                  )
                ],
              ),
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
                            style: const TextStyle(
                              // backgroundColor: Colors.black87,
                              shadows: [
                                Shadow(blurRadius: 12, color: Colors.black)
                              ],
                            ),
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
                          height: 75,
                          child: Center(
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  print("ADD WATCH LIST");
                                },
                                child:
                                    const Icon(Icons.list, color: Colors.black),
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
                                  print("ADD ALREADY SEEN LIST");
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
    );
  }
}
