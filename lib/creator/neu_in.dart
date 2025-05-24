import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import 'light_source.dart';

class NeuIn extends StatelessWidget {
  final Color color;
  final Color? lightColor;
  final Color? shadowColor;
  final bool applyLightAndShadowValues;
  final double darkenValue;
  final double lightenValue;
  final double shadowAndLightBlurValue;
  final double edgeBlurValue;
  final double shift;
  final Directions direction;
  final Offset? offsetShadow;
  final Offset? offsetLight;
  final double? width;
  final double? height;
  final Alignment alignment;
  final BorderRadius borderRadius;
  final BoxBorder? border;
  final Widget child;
  const NeuIn({
    super.key,
    required this.color,
    this.lightColor,
    this.shadowColor,
    this.applyLightAndShadowValues = false,
    this.darkenValue = .1,
    this.lightenValue = .1,
    this.shadowAndLightBlurValue = 14.0,
    this.edgeBlurValue = 2.0,
    this.shift = 10.0,
    this.direction = Directions.topLeft,
    this.offsetShadow,
    this.offsetLight,
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
      decoration: BoxDecoration(border: border, borderRadius: borderRadius),
      child: InnerShadow(
        shadows: [
          Shadow(
            // SHADOW
            color: sv,
            blurRadius: shadowAndLightBlurValue,

            offset: lightSource.shadow(direction),
          ),
          Shadow(
            // LIGHT
            color: lv,

            blurRadius: shadowAndLightBlurValue,

            offset: lightSource.light(direction),
          ),
          Shadow(
            // BLURED EDGE
            color: color,
            blurRadius: edgeBlurValue,
            offset: Offset.zero,
          ),
        ],
        child: Container(
          alignment: alignment,
          decoration: BoxDecoration(color: color, borderRadius: borderRadius),
          child: child,
        ),
      ),
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
