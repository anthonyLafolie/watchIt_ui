import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imgUrl;
  const CarouselItem({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/original$imgUrl",
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
        // Container(
        //   height: double.infinity,
        //   color: Colors.white,
        // ),
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
                          child: const Text(
                            "Spider-Man: No Way Home",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
                          child: const Text(
                            "Après les évènements liés à l'affrontement avec Mystério, l'identité secrète de Spider-Man a été révélée. Il est poursuivi par le gouvernement américain, qui l'accuse du meurtre de Mystério, et est traqué par les médias. Cet évènement a également des conséquences terribles sur la vie de sa petite-amie M. J. et de son meilleur ami Ned. Désemparé, Peter Parker demande alors de l'aide au Docteur Strange. Ce dernier lance un sort pour que tout le monde oublie que Peter est Spider-Man. Mais les choses ne se passent pas comme prévu et cette action altère la stabilité de l'espace-temps. Cela ouvre le « Multivers », un concept terrifiant dont ils ne savent quasiment rien.",
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
