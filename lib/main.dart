import 'package:flutter/material.dart';
import 'package:loginuicolors/addtask.dart';
import 'package:loginuicolors/dashboard.dart';
import 'package:loginuicolors/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login', // Set the initial route to the Dashboard page
    routes: {
      '/': (context) => Dashboard(), // Define the route for the Dashboard page
      'login': (context) => MyLogin(),
      'add_task': (context) => AddTask(), // Define the route for the AddTask page
    },
  ));
}
