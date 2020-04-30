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
                  right: screenUtil.setWidth(200)),
              child: Text(
                'The ReFex Choice',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Stack(
              children: <Widget>[
                mainCard(),
                Positioned(
                  top: screenUtil.setHeight(-13),
                  bottom: screenUtil.setHeight(-5),
                  right: -40,
                  child: Container(
                    child: Image.asset(
                      'assets/wine_bottle_2.png',
                      height: screenUtil.setHeight(230),
                      width: screenUtil.setWidth(200),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ROTARI BRUT',
                        style: Theme.of(context).textTheme.headline.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Wine type: Rose brut',
                        style: Theme.of(context).textTheme.display3.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              // fontWeight: FontWeight.,
                            ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Quantity: 1.5 L',
                        style: Theme.of(context).textTheme.display3.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                              // fontWeight: FontWeight.,
                            ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35)),
                      child: Center(
                        child: Text(
                          '\$ 11.97',
                          style: Theme.of(context).textTheme.headline.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                // fontWeight: FontWeight.,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Last Orders',
                    style: Theme.of(context).textTheme.headline.copyWith(
                          color: Colors.black,
                          // fontSize: 15,
                        ),
                  ),
                ],
              ),
            ),
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
        top: screenUtil.setHeight(25),
      ),
      child: Container(
        // height: 200,
        child: Stack(
          children: <Widget>[
            Container(
              height: screenUtil.setHeight(190),
              decoration: BoxDecoration(
                color: Color(0xffb97aa0),
                borderRadius: BorderRadius.circular(11),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    // offset: Offset(3, 3),
                    blurRadius: 12,
                    spreadRadius: 0.2,
                    color: Color(0xffb46b98),
                  ),
                ],
              ),
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
