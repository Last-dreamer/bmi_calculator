import 'package:flutter/material.dart';


// Refactoring our code
class ReusableCard extends StatelessWidget {
  //  key is used to keep track of the state of the widget

  ReusableCard({@required this.color,this.childCard,this.onPress});
  // when we create a new ReusableCard  the existing color will be destroyed  that's why we use final with color
  // we can't use const because , A const can't have access to anything in the runtime..
  final Color color;
  final  Widget childCard;
  // function as a first order.......
  final Function  onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
        child:Container(
         child: Container(
           child: childCard),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
         color: color,
         borderRadius: BorderRadius.circular(10.0),
      ),),
    );
  }
}