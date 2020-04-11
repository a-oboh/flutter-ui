import 'package:flutter/material.dart';

class ElasticSidebar extends StatefulWidget {
  @override
  _ElasticSidebarState createState() => _ElasticSidebarState();
}

class _ElasticSidebarState extends State<ElasticSidebar> {
  // offsset for finger position - initial is 0, 0
  Offset _offset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    //width of side bar
    double sidebarSize = screenSize.width * 0.65;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.cyan,
            ],
          ),
        ),
        width: screenSize.width,
        child: Stack(
          children: <Widget>[
            Center(
              child: RaisedButton(
                color: Colors.white,
                child: Text(
                  'Simple Button',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: sidebarSize,
              child: GestureDetector(
                onPanUpdate: (details) {
                  // set _offset to be equal to the one given
                  // by the gesture detector on user interaction
                  // if the offset dx is not outside the sidebar
                  if (details.localPosition.dx <= sidebarSize) {
                    setState(() {
                      _offset = details.localPosition;
                    });
                  }
                },
                onPanEnd: (details) {
                  //set offset to 0, 0 when user removes finger
                  setState(() {
                    _offset = Offset(0, 0);
                  });
                },
                child: Stack(
                  children: <Widget>[
                    CustomPaint(
                      size: Size(sidebarSize, screenSize.height),
                      painter: DrawerPainter(
                        offset: _offset,
                      ),
                    ),
                    Container(
                      
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerPainter extends CustomPainter {
  final Offset offset;

  DrawerPainter({@required this.offset});

  // set default control point to width, to make it staright by default
  // if the offset.dx is less than width, meaning:
  // the user is swiping to the inside, it should flex out width + 75
  getControlPoint(double width) {
    if (offset.dx == 0) {
      return width;
    } else if (offset.dx > width) {
      return offset.dx;
    } else {
      return width + 75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        getControlPoint(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
