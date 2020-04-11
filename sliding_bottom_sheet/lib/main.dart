import 'package:flutter/material.dart';
import 'package:sliding_bottom_sheet/liquid_slider_animation/l_s_anim.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ElasticSidebar(),
    );
  }
}

