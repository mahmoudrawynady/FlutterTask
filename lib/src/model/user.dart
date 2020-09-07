import 'dart:math';

class User {
  String pictureUrl;
  String email;
  String name;
  String streetNum;
  String streetName;
  String city;
  String state;

  User(
    String pictureUrl,
    String name,
    String email,
    String streetNum,
    String streetName,
    String city,
    String state,
  ) {
    this.pictureUrl = pictureUrl;
    this.name = name;
    this.email = email;
    this.streetNum = streetNum;
    this.streetName = streetName;
    this.city = city;
    this.state = state;
  }
}
