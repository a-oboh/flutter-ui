import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        allowFontScaling: false);

    ScreenUtil _screenUtil = ScreenUtil();

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: _screenUtil.setHeight(45),
                      width: _screenUtil.setWidth(45),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/avatar1.jpg'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(60),
                          border:
                              Border.all(width: 1, color: Colors.grey[300])),
                    ),
                    Positioned(
                      right: _screenUtil.setWidth(0),
                      top: _screenUtil.setHeight(6),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[900],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomPaint(
                  painter: MenuPainter(),
                  child: Container(
                    height: _screenUtil.setHeight(35),
                    width: _screenUtil.setWidth(35),
                  ),
                ),
              ],
            ),
            
          ),
        ],
      ),
    ));
  }
}

class MenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    //paint properties
    paint.color = Colors.green[900];
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4.0;

    //middle line
    Offset gp1 = Offset(size.width * 0.15, size.height * 0.5);
    Offset gp2 = Offset(size.width * 0.80, size.height * 0.5);

    canvas.drawLine(gp1, gp2, paint);

    //top line
    Offset gp3 = Offset(size.width * 0.15, size.height * 0.3);
    Offset gp4 = Offset(size.width * 0.50, size.height * 0.3);

    canvas.drawLine(gp3, gp4, paint);

    //bottom line
    Offset gp5 = Offset(size.width * 0.50, size.height * 0.7);
    Offset gp6 = Offset(size.width * 0.80, size.height * 0.7);

    canvas.drawLine(gp5, gp6, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
