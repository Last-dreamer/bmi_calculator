import 'package:flutter/material.dart';
import 'dart:math';
class Calculate{

  Calculate({this.height,this.weight});
  int height;
  int weight;
  double _bmi;
  String calculateBmi(){
    //height /100 because of cm 
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }


  String  getResult(){
    if(_bmi> 25){
      return 'overWeight';
    }else if( _bmi>18.5){
       return 'Normal';
    }else{
      return 'underWeigtht';
    }
  }


  String getInterpretation(){
    if(_bmi> 25){
      return 'YOu have a heigher then normal body wieght. '
          'Try to Exersice more..';
    }else if( _bmi>18.5){
      return 'You have a normal body weight .Good job!..';
    }else{
      return 'You have a lower then the normal weight .Try to eat to more..';
    }
  }
}

