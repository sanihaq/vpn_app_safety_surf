import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';

class TestApp extends StatelessWidget {
  TestApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(3.264, 1.072),
                colors: [const Color(0xff5e5ce6), const Color(0xff64d2ff)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          BlendMask(
            blendMode: BlendMode.overlay,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x1affffff),
                    borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x33ffffff),
                    borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                  margin: EdgeInsets.all(35.0),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x4dffffff),
                    borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                  margin: EdgeInsets.all(74.0),
                ),
                Center(
                  child: Container(
                    width: 131.0,
                    height: 131.0,
                    decoration: BoxDecoration(
                      color: const Color(0x66ffffff),
                      borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
