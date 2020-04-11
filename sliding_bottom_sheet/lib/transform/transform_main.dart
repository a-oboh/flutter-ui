import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformMain extends StatefulWidget {
  @override
  _TransformMainState createState() => _TransformMainState();
}

class _TransformMainState extends State<TransformMain>
    with SingleTickerProviderStateMixin {
  Animation<double> roundAnim;

  AnimationController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    roundAnim = Tween<double>(begin: 0.0, end: 50.0).animate(ctrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tranform Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          children: <Widget>[
            AnimatedBuilder(
                animation: ctrl,
                builder: (context, child) {
                  return rotate(ctrl.value);
                }),
            // rotate(ctrl.value),
          ],
        ),
      ),
    );
  }

  Widget rotate(double value) {
    return Center(
      child: Transform.rotate(
        angle: value * 2.0 * math.pi,
        // origin: Offset(50.0, 50.0),
        // offset: Offset(value, 0.0),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Text(
            'Top',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }

  Widget translate(double value) {
    return Center(
      child: Transform.translate(
        // angle: value * 2.0 * math.pi,
        // origin: Offset(50.0, 50.0),
        offset: Offset(value, 0.0),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Text(
            'Top',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }

  Widget threeD(double value) {
    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(7),
        // angle: value * 2.0 * math.pi,
        // origin: Offset(50.0, 50.0),
        // offset: Offset(value, 0.0),
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Text(
            'Top',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
