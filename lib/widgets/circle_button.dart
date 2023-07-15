import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99,
      height: 99,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(
            strokeAlign: BorderSide.strokeAlignInside,
            color: Color.fromARGB(255, 243, 245, 247),
            width: 1,
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(31, 122, 122, 122),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Center(
        child: Text(
          'START',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Antonio',
            fontWeight: FontWeight.w300,
            letterSpacing: 2,
            foreground: Paint()
              ..shader = const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Color.fromARGB(255, 100, 210, 255),
                  Color.fromARGB(255, 94, 92, 230),
                ],
              ).createShader(
                const Rect.fromLTWH(0.0, 0.0, 51.0, 31.0),
              ),
          ),
        ),
      ),
    );
  }
}
