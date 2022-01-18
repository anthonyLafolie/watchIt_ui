import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Page2 extends StatelessWidget {
  Color color;
  Page2({Key? key, required this.color}) : super(key: key);

  static Route route(Color color) {
    return MaterialPageRoute<void>(
        builder: (_) => Page2(
              color: color,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
