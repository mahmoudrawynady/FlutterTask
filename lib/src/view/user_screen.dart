import 'package:course_project/src/bloc/user_bloc.dart';
import 'package:course_project/src/model/data.dart';
import 'package:course_project/src/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../src/util/const.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

void main() {
  runApp(Home());
}

class _HomeState extends State<Home> {
  User _user;

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllUsers(); // To fetch user data;
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Scaffold(body: creatStream()));
  }

  // To create Stream data
  Widget creatStream() {
    bloc.fetchAllUsers();
    return StreamBuilder(
        stream: bloc.allUsers,
        builder: (context, AsyncSnapshot<UserData> snapshot) {
          if (snapshot.hasData) {
            _fillUserData(snapshot.data.results[0]);
            return createUserWidget();
          }
          if (snapshot.hasError) {
            return createErrorMessage();
          }
          if (!snapshot.hasData) {
            return createLoader();
          }
        });
  }

  // To handle error scenarios
  Widget handleErrors(AsyncSnapshot<UserData> snapshot) {
    if (snapshot.hasError) {
      return createErrorMessage();
    }
    if (!snapshot.hasData) {
      return createLoader();
    }
  }

  // To Creat loader widget
  Widget createLoader() {
    return Container(
        decoration: creatBoxDecoration(),
        child: Center(
            child: SpinKitCircle(
          color: Colors.white,
          size: AppConst.LOADER_SIZE,
        )));
  }

  // To show user Data
  List<Widget> showUserData() {
    return <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(_user.pictureUrl),
        radius: AppConst.AVATAR_SIZE,
      ),
      _createText(_user.name, AppConst.FONT_COLOR, AppConst.LARGE_FONT_SIZE,
          AppConst.APP_FONT_FAMILY),
      _createText(_user.email, AppConst.FONT_COLOR, AppConst.MEDIUM_FONT_SIZE,
          AppConst.APP_FONT_FAMILY),
      _createText(
          _user.streetNum + " " + _user.streetName + " st",
          AppConst.FONT_COLOR,
          AppConst.SMALL_FONT_SIZE,
          AppConst.APP_FONT_FAMILY),
      _createText(_user.city, AppConst.FONT_COLOR, AppConst.SMALL_FONT_SIZE,
          AppConst.APP_FONT_FAMILY),
      _createText(_user.state, AppConst.FONT_COLOR, AppConst.SMALL_FONT_SIZE,
          AppConst.APP_FONT_FAMILY),
    ];
  }

  // To create user details widget.
  Widget createUserWidget() {
    return Container(
        padding: EdgeInsets.only(top: AppConst.USER_SCREEN_PADDING_NUMBER),
        decoration: creatBoxDecoration(),
        child: Center(
            child: Column(children: [Column(children: showUserData())])));
  }

// To create error message widget.
  Widget createErrorMessage() {
    return Container(
        decoration: creatBoxDecoration(),
        child: Center(
            child: _createText(AppConst.ERROR_MESSAGE, Colors.white,
                AppConst.LARGE_FONT_SIZE, AppConst.APP_FONT_FAMILY)));
  }

  // To creat box decoration
  Decoration creatBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment(0.8, 0.0),
        // 10% of the width, so there are ten blinds.
        colors: [
          const Color(AppConst.DARK_ORANGE),
          const Color(AppConst.LIGHT_ORANGE)
        ], // whitish to gray
      ),
    );
  }

  // To fill user data when loaded.
  void _fillUserData(Results result) {
    _user = new User(
        result.picture.large,
        result.name.first + " " + result.name.last,
        result.email,
        result.location.street.number.toString(),
        result.location.street.name,
        result.location.city,
        result.location.state);
  }

  // To create a common text widget in the app instead of repeating them.
  Widget _createText(
      String text, Color color, int fontSize, String fontFamily) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: fontSize.toDouble(),
            fontFamily: fontFamily));
  }
}
