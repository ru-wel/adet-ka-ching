// PACKAGE IMPORTS
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

// COMPONENT IMPORTS
// import 'components/CustomAppBar.dart';

// PAGE IMPORTS
import 'pages/AddExpense.dart';
import 'pages/homePage.dart';

void main(){
  runApp(routing());
}

class routing extends StatelessWidget {
  const routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: "KA-CHING", 
      home: const homePage(), 
      // home: const CustomAppBar(), 
      routes: {
        'addExpense': (BuildContext ctx) => const AddExpense(),
      } 
    );
  }
}


