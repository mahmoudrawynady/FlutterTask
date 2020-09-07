import 'dart:async';
import 'package:course_project/src/view/user_screen.dart';
import '../../src/util/const.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: AppConst.SPLASH_WAITING_SECONDS),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Home()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(AppConst.SPLASH_PADDING_NUMBER),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 0.0),
            // 10% of the width, so there are ten blinds.
            colors: [
              const Color(AppConst.DARK_ORANGE),
              const Color(AppConst.LIGHT_ORANGE)
            ], // whitish to gray
          ),
        ),

        child:Center(child:Image.asset(AppConst.SPLASH_IMAGE_PATH))
    );
  }
}
