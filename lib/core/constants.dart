import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Money Blaster';
  static const String fullAppName = 'Money Blaster Tournament';
  static const String selectGame = 'Select Game';
  static const String login = 'Login';
  static const String wallet = 'Wallet';
  static const String createAccount = 'Create Account';
  static const String userName = 'User Name';
  static const String tournament = 'Tournament';
  static const String uploadGameIdDesc = 'Upload your game ID screen shot';
  static const String defaultButtonText = 'Continue';

  static const List<String> gamesList = ['BGMI', 'FREE FIRE'];

  static const List<String> gameOption = ['BGMI', 'FREEFIRE'];
  static const List<String> cameraOptions = ['TPP', 'FPP'];
  static const List<String> teamOptions = ['SOLO', 'SQUAD'];

  // AdsTerra
  static const String adUrl =
      'https://www.highcpmgate.com/xp77pev6?key=12e806d3bd43af4e266d90e49a33d198';
}

class AppColors {
  static const Color blackBackground = Color(0xff070707);
  static const Color white = Color(0xffffffff);
  static const Color red = Color.fromRGBO(165, 10, 10, 1);
  static const Color greyText = Color.fromRGBO(255, 255, 255, 1);
  static const Color blue = Color.fromRGBO(0, 222, 222, 1);
  static const Color greyLight = Color.fromRGBO(171, 171, 171, 1);

  static const List<Color> silverGradientBorder = [
    Color(0xffa1a1a1),
    Color(0xfff8f8f8),
    Color(0xff898989)
  ];
  static const List<Color> goldGradientBorder = [
    Color(0xffdba454),
    Color(0xfffae1a5),
    Color(0xffedc27d),
    Color(0xffdfa716)
  ];
  static const List<Color> bronzeGradientBorder = [
    Color(0xff874900),
    Color(0xffb08724),
    Color(0xff8d5700),
    Color(0xffdfa716)
  ];

  static const List<Color> tabBorder = [
    Color(0x0000dede),
    Color(0xb229d1d1),
    Color(0xb273ffff),
    Color(0xb229d1d1),
    Color(0x0029d1d1)
  ];

  static const primaryColor = Color(0xff00DEDE);

  static const glassColor = Color.fromRGBO(255, 255, 255, 0.1);

  static const Color popUpColor = Color.fromRGBO(0, 0, 0, 0.2);

  static const gradientBorderGlare = [
    Color.fromRGBO(255, 255, 255, 0.5),
    Color.fromRGBO(255, 255, 255, 0),
    Color.fromRGBO(255, 255, 255, 0),
    Color.fromRGBO(255, 255, 255, 0.5),
  ];
}
