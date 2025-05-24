import 'package:flutter/widgets.dart';

class LightSource {
  final double shift;

  const LightSource({required this.shift});

  Offset light(Directions direction) {
    switch (direction) {
      case Directions.topLeft:
        return Offset(-shift, -shift);

      case Directions.topRight:
        return Offset(shift, -shift);

      case Directions.bottomLeft:
        return Offset(-shift, shift);

      case Directions.bottomRight:
        return Offset(shift, shift);

      case Directions.left:
        return Offset(-shift, 0);

      case Directions.right:
        return Offset(shift, 0);

      case Directions.top:
        return Offset(0, -shift);

      case Directions.bottom:
        return Offset(0, shift);
    }
  }

  Offset shadow(Directions direction) {
    switch (direction) {
      case Directions.topLeft:
        return Offset(shift, shift);

      case Directions.topRight:
        return Offset(-shift, shift);

      case Directions.bottomLeft:
        return Offset(shift, -shift);

      case Directions.bottomRight:
        return Offset(-shift, -shift);

      case Directions.left:
        return Offset(shift, 0);

      case Directions.right:
        return Offset(-shift, 0);

      case Directions.top:
        return Offset(0, shift);

      case Directions.bottom:
        return Offset(0, -shift);
    }
  }
}

enum Directions {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  left,
  right,
  top,
  bottom,
}
