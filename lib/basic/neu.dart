import 'package:flutter/material.dart';
import 'package:neumorphlutter/creator/neu_out.dart';

class Neu extends StatefulWidget {
  final Color color;
  final Widget child;
  const Neu({super.key, required this.color, required this.child});

  @override
  State<Neu> createState() => _NeuState();
}

class _NeuState extends State<Neu> {
  @override
  Widget build(BuildContext context) {
    return NeuOut(color: widget.color, child: widget.child);
  }
}
