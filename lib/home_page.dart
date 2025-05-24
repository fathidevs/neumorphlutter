import 'package:flutter/material.dart';

import 'basic/light_source_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Color _bgColor = const Color.fromARGB(255, 230, 230, 230);
int _pickedTitleIndex = 0;
List<String> _titles = ['light source', 'change shape', 'animation'];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.  center,
              children: [
                Expanded(child: _pages()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _bottomBar([
                    _bottomBarBtn(0, _titles[0], () {
                      _change(0);
                    }),
                    _bottomBarBtn(1, _titles[1], () {
                      _change(1);
                    }),
                    _bottomBarBtn(2, _titles[2], () {
                      _change(2);
                    }),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomBar(List<Widget> children) {
    return Padding(
      padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight * 2.0),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Widget _bottomBarBtn(int index, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 18.0,
            color: index == _pickedTitleIndex ? Colors.black54 : Colors.black26,
          ),
        ),
      ),
    );
  }

  _change(int index) {
    //
    setState(() {
      _pickedTitleIndex = index;
    });
  }

  Widget _pages() {
    switch (_pickedTitleIndex) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LightSourcePreview(bgColor: _bgColor),
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CHANGE COLOR',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
                SizedBox(width: 40.0),
                _colorChip(
                  const Color.fromARGB(255, 230, 230, 230),
                  Colors.black26,
                ),
                _colorChip(Colors.lightGreen, Colors.black26),
                _colorChip(Colors.brown, Colors.black26),
                _colorChip(Colors.cyan, Colors.black26),
                _colorChip(Colors.deepOrange, Colors.black26),
                _colorChip(Colors.deepPurple, Colors.black26),
                _colorChip(Colors.indigo, Colors.black26),
                _colorChip(Colors.lime, Colors.black26),
                _colorChip(Colors.teal, Colors.black26),

                _colorChip(Colors.blueGrey, Colors.black26),
                _colorChip(Colors.grey, Colors.black26),
              ],
            ),
          ],
        );
      default:
        return Center(
          child: Text(
            'WIP',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
        );
    }
  }

  Widget _colorChip(Color color, Color borderColor) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          _bgColor = color;
        });
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(300.0),
        ),
      ),
    );
  }
}
