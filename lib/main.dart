import 'package:flutter/material.dart';
import 'package:loginuicolors/addtask.dart';
import 'package:loginuicolors/dashboard.dart';
import 'package:loginuicolors/login.dart';
// import 'package:loginuicolors/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AddTask(),        
    routes: {
      
      'login': (context) => MyLogin(),
      'dashboard': (context) => Dashboard(),
    },
  ));
}
