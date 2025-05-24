import 'package:flutter/material.dart';

import 'light_source.dart';

class NeuOut extends StatelessWidget {
  final Color color;
  final Color? lightColor;
  final Color? shadowColor;
  final bool applyLightAndShadowValues;
  final double darkenValue;
  final double lightenValue;
  final double shadowAndLightBlurValue;
  final double edgeBlurValue;
  final double edgeSpreadValue;
  final double shift;
  final Directions direction;
  final double? width;
  final double? height;
  final Alignment alignment;
  final BorderRadius borderRadius;
  final BoxBorder? border;
  final Widget child;
  const NeuOut({
    super.key,
    required this.color,
    this.lightColor,
    this.shadowColor,
    this.applyLightAndShadowValues = false,
    this.darkenValue = .07,
    this.lightenValue = .07,
    this.shadowAndLightBlurValue = 14.0,
    this.edgeBlurValue = 0.5,
    this.edgeSpreadValue = 2.0,
    this.shift = 10.0,
    this.direction = Directions.topLeft,

    this.width = 180.0,
    this.height = 70.0,
    this.alignment = Alignment.center,
    this.borderRadius = const BorderRadius.all(Radius.circular(100.0)),
    this.border,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    LightSource lightSource = LightSource(shift: shift);
    Color lv =
        lightColor == null
            ? _lighten(color, lightenValue)
            : _lighten(lightColor!, lightenValue, applyLightAndShadowValues);
    Color sv =
        shadowColor == null
            ? _darken(color, darkenValue)
            : _darken(shadowColor!, darkenValue, applyLightAndShadowValues);
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: border,
        boxShadow: [
          BoxShadow(
            // LIGHT
            color: lv,
            offset: lightSource.light(direction),
            blurRadius: shadowAndLightBlurValue,
          ),
          BoxShadow(
            // SHADOW
            color: sv,
            offset: lightSource.shadow(direction),
            blurRadius: shadowAndLightBlurValue,
          ),

          BoxShadow(
            // BLURED EDGE
            color: color,
            offset: Offset.zero,
            spreadRadius: edgeSpreadValue,
            blurRadius: edgeBlurValue,
          ),
        ],
      ),
      child: child,
    );
  }
}

Color _darken(Color color, [double amount = .1, bool apply = true]) {
  if (!apply) return color;

  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color _lighten(Color color, [double amount = .1, bool apply = true]) {
  if (!apply) return color;
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
