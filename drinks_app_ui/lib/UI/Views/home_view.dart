import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            buildTop(),
            Padding(
              padding: EdgeInsets.only(
                  left: screenUtil.setWidth(14),
                  right: screenUtil.setWidth(150)),
              child: Text(
                'The ReFex Choice',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            mainCard(),
            // Positioned(
            //   top: screenUtil.setHeight(-13),
            //   bottom: screenUtil.setHeight(-5),
            //   right: -40,
            //   child: Container(
            //     child: Image.asset(
            //       'assets/wine_bottle_2.png',
            //       height: screenUtil.setHeight(230),
            //       width: screenUtil.setWidth(200),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget mainCard() {
    return Padding(
      padding: EdgeInsets.only(
          left: screenUtil.setWidth(14),
          right: screenUtil.setWidth(14),
          top: screenUtil.setHeight(25)),
      child: Container(
        // height: 200,
        child: Stack(
          children: <Widget>[
            Container(
              height: screenUtil.setHeight(170),
              decoration: BoxDecoration(
                color: Color(0xffb97aa0),
                borderRadius: BorderRadius.circular(11),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 20,
                    spreadRadius: 0.5,
                    color: Color(0xffb46b98),
                  ),
                ],
              ),
            ),
            CustomPaint(
              size: Size(screenUtil.setWidth(double.infinity),
                  screenUtil.setHeight(170)),
              painter: FirstCircle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(14),
          vertical: screenUtil.setHeight(17)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: screenUtil.setHeight(3),
                width: screenUtil.setWidth(35),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(6),
              ),
              Container(
                height: screenUtil.setHeight(3),
                width: screenUtil.setWidth(27),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: screenUtil.setHeight(6),
              ),
              Container(
                height: screenUtil.setHeight(3),
                width: screenUtil.setWidth(30),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
          Icon(
            LineAwesomeIcons.search,
          ),
        ],
      ),
    );
  }
}

class FirstCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xffb46b98);

    double radius = 11;
    double height = size.height;
    double width = size.width;

    Path path = Path();
    Path path2 = Path();

    path.moveTo(0, height);

    path.lineTo(width - radius, height);

    path.quadraticBezierTo(width, height, width, height - radius);

    path.lineTo(width, height / 2);

    // path.quadraticBezierTo(
    //     width, 0, width - radius, 0);

    path.quadraticBezierTo(-radius, 2 * radius, 0, height);

    path2.moveTo(width / 2, 0);

    path2.lineTo(width, radius);

    // path2.quadraticBezierTo(width, 0, width - radius, 0);

    path2.lineTo(width, 0);

    canvas.drawPath(path2, paint);

    // Offset center = Offset(size.width - 5, size.height * 0.2);

    // Offset center2 = Offset(size.width * 0.14, size.height - 10);

    // canvas.drawCircle(center, 75, paint);

    // canvas.drawCircle(center2, 20, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SecondCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xffb46b98);

    Offset center = Offset(size.width, size.height);

    canvas.drawCircle(center, 20, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.lineTo(0, height - 14);

    path.quadraticBezierTo(-4, 188, 150, height);

    path.lineTo(width - 12, height);

    path.quadraticBezierTo(width, 170, width, height - 20);

    path.lineTo(width - 5, 10);

    path.quadraticBezierTo(width, -20, -width, 30);

    // path.lineTo(10, 10);

    // path.quadraticBezierTo(0, 0, 0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
