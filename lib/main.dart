import 'package:flutter/material.dart';
import 'package:flutter_database_demo/Constant/Constant.dart';
import 'package:flutter_database_demo/Screens/AddEmployeeScreen.dart';
import 'package:flutter_database_demo/Screens/EmployeeList.dart';
import 'package:flutter_database_demo/Screens/SplashScreen.dart';



main() {
  runApp(new MaterialApp(
    title: 'Database Demo',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        accentColor: Colors.black,
        primaryColor: Colors.black,
        primaryColorDark: Colors.black),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => new HomeScreen(),
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen()
      //ADD_EMPLOYEE: (BuildContext context) => new AddEmployeeScreen()
    },
  ));
}
