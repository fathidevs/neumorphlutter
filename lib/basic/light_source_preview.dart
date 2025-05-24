import 'package:flutter/material.dart';
import 'package:neumorphlutter/creator/neu_in.dart';
import 'package:neumorphlutter/creator/neu_out.dart';

import '../creator/light_source.dart';

class LightSourcePreview extends StatefulWidget {
  final Color bgColor;
  const LightSourcePreview({super.key, required this.bgColor});

  @override
  State<LightSourcePreview> createState() => _LightSourcePreviewState();
}

// Color _bgColor = const Color.fromARGB(255, 237, 199, 199);
int _bulbIndexOn = 0;
List<Directions> directions = [
  Directions.topLeft,
  Directions.top,
  Directions.topRight,
  Directions.left,
  Directions.right,
  Directions.bottomLeft,
  Directions.bottom,
  Directions.bottomRight,
];
bool _isOut = true;

class _LightSourcePreviewState extends State<LightSourcePreview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000.0,
      // height: 400.0,
      // color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: bulbPlace(Alignment.bottomRight, 0)),
              Expanded(flex: 2, child: bulbPlace(Alignment.bottomCenter, 1)),
              Expanded(child: bulbPlace(Alignment.bottomLeft, 2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: bulbPlace(Alignment.centerRight, 3)),
              Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isOut = !_isOut;
                        });
                      },
                      child:
                          _isOut
                              ? NeuOut(
                                width: 350.0,
                                height: 100.0,
                                color: widget.bgColor,
                                direction: directions[_bulbIndexOn],
                                child: Text(
                                  'NeuOut',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                  ),
                                ),
                              )
                              : NeuIn(
                                width: 350.0,
                                height: 100.0,
                                color: widget.bgColor,
                                direction: directions[_bulbIndexOn],
                                child: Text(
                                  'NeuIn',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                    ),
                  ),
                ),
              ),
              Expanded(child: bulbPlace(Alignment.centerLeft, 4)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: bulbPlace(Alignment.topRight, 5)),
              Expanded(flex: 2, child: bulbPlace(Alignment.topCenter, 6)),
              Expanded(child: bulbPlace(Alignment.topLeft, 7)),
            ],
          ),
        ],
      ),
    );
  }

  Widget bulbPlace(Alignment alignment, int index) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            _bulbIndexOn = index;
          });
        },
        child: _bulb(alignment, isOn: index == _bulbIndexOn),
      ),
    );
  }

  Widget _bulb(Alignment alignment, {bool isOn = false}) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: isOn ? Colors.white : Colors.black12,
          borderRadius: BorderRadius.circular(500.0),
          boxShadow: [
            if (isOn)
              BoxShadow(
                color: Colors.white,
                blurRadius: 8.0,
                spreadRadius: 3.0,
              ),
          ],
        ),
      ),
    );
  }
}
