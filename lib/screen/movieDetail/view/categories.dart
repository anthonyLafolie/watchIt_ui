import 'package:flutter/material.dart';
import 'package:watch_it/model/movie_detail.dart';

class Categories extends StatelessWidget {
  final MovieDetail movieDetail;
  const Categories({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 10.0, right: 20.0, left: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: ["Action", "Aventure"].map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(category),
              backgroundColor: Colors.black12,
            ),
          );
        }).toList()),
      ),
    );
  }
}
