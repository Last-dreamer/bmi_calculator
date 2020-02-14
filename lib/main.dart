import 'package:flutter/material.dart';
import 'bmi.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
    primaryColor: Color(0xFF0A0A21),
    scaffoldBackgroundColor: Color(0xFF0A0A21)
),
home:Scaffold(
    appBar: AppBar(title: Text('BMI Calculator' ,
        style:TextStyle(color:Color(0xFF8D8E98),
        fontFamily: 'pacifico regular'),
    ),),
body:MyApp(),),
));

