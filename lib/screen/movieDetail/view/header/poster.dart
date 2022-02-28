import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  static const potserRatio = 0.7;

  const Poster({Key? key, required this.posterUrl, this.height = 100.0})
      : super(key: key);

  final String posterUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = potserRatio * height;

    return Image.network(
      posterUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
