import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_ui/views/my_colors.dart';

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
        child: Padding(
          padding: EdgeInsets.fromLTRB(_screenUtil.setWidth(10),
              _screenUtil.setHeight(10), _screenUtil.setWidth(10), 0),
          child: ListView(
            children: <Widget>[
              Row(
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
                            color: PlantColors.green,
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
              SizedBox(
                height: _screenUtil.setHeight(20),
              ),
              Material(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                type: MaterialType.card,
                elevation: 8,
                shadowColor: Colors.grey[400],
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Plant',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: PlantColors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _screenUtil.setHeight(20),
              ),
              Container(
                height: 300,
                width: 50,
                padding: EdgeInsets.only(left: 70, right: 70),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                  // margin: EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/plant1.png',
                        scale: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    //paint properties
    paint.color = PlantColors.green;
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
