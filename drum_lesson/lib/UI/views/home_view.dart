import 'package:drum_lesson/UI/views/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScreenUtil screenUtil = ScreenUtil();
  int currentIndex = 0;
  final List<Widget> children = [
    Dashboard(),
    PlaceholderWidget(Color(0xff3b2768)),
    PlaceholderWidget(Color(0xfffc5157)),
    PlaceholderWidget(Color(0xff1ac7b8)),
    PlaceholderWidget(Color(0xffffac2c)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: children[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.black,
        ),
        child: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          //hide titles
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex:
              currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.clock_o,
                size: screenUtil.setSp(30),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Linecons.params),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Linecons.comment),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineariconsFree.heart_1),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(20),
      ),
      child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: screenUtil.setHeight(50),
              width: screenUtil.setWidth(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/a-1.jpg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: Colors.grey[850],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headline.copyWith(
                      fontSize: screenUtil.setSp(35),
                    ),
              ),
              Text(
                'To Pump!',
                style: Theme.of(context).textTheme.headline.copyWith(
                      fontSize: screenUtil.setSp(35),
                    ),
              ),
            ],
          ),
          SizedBox(
            height: screenUtil.setHeight(40),
          ),
          Container(
            child: GridView.count(
              physics: ScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: screenUtil.setWidth(14),
              mainAxisSpacing: screenUtil.setHeight(12),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff3b2768),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.3,
                            child: Container(
                              height: screenUtil.setHeight(100),
                              width: screenUtil.setWidth(87),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenUtil.setHeight(15),
                            left: screenUtil.setWidth(8.6),
                            child: Image.asset(
                              'assets/drums.png',
                              height: screenUtil.setHeight(70),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Technique',
                        style: Theme.of(context).textTheme.display1.copyWith(
                              color: Colors.white,
                              fontSize: screenUtil.setSp(20),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffc5157),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.3,
                            child: Container(
                              height: screenUtil.setHeight(100),
                              width: screenUtil.setWidth(87),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenUtil.setHeight(16),
                            left: screenUtil.setWidth(8.6),
                            child: Image.asset(
                              'assets/vault.png',
                              height: screenUtil.setHeight(70),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Arsenal',
                        style: Theme.of(context).textTheme.display1.copyWith(
                              color: Colors.white,
                              fontSize: screenUtil.setSp(20),
                            ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff1ac7b8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.3,
                            child: Container(
                              height: screenUtil.setHeight(100),
                              width: screenUtil.setWidth(87),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenUtil.setHeight(10),
                            left: screenUtil.setWidth(5),
                            child: Image.asset(
                              'assets/joystick.png',
                              height: screenUtil.setHeight(80),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Coordination',
                        style: Theme.of(context).textTheme.display1.copyWith(
                              color: Colors.white,
                              fontSize: screenUtil.setSp(20),
                            ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffac2c),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.3,
                            child: Container(
                              height: screenUtil.setHeight(100),
                              width: screenUtil.setWidth(87),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenUtil.setHeight(15),
                            left: screenUtil.setWidth(8),
                            child: Image.asset(
                              'assets/vinyl.png',
                              height: screenUtil.setHeight(70),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Songs',
                        style: Theme.of(context).textTheme.display1.copyWith(
                              color: Colors.white,
                              fontSize: screenUtil.setSp(20),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    LineAwesomeIcons.angle_left,
                    size: screenUtil.setSp(27),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'LESSON PLAN',
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Colors.white,
                            letterSpacing: 1,
                            // fontSize: screenUtil.setSp(17),
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'YOUR PROGRESS',
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Colors.white,
                            letterSpacing: 1,
                            // fontSize: screenUtil.setSp(17),
                          ),
                    ),
                  ),
                  Icon(
                    LineAwesomeIcons.angle_right,
                    size: screenUtil.setSp(27),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
