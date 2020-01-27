import 'package:flutter/material.dart';

class HeaderShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 246, 246),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(350),
          bottomRight: Radius.circular(350),
        ),
      ),
    );
  }
}
