import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({@required this.onPress,this.buttonTitle});
  final Function onPress;
  final  String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child:Text(buttonTitle,
              style:numberStyle.copyWith(fontSize: 40.0)),),
        margin: EdgeInsets.only(top: 5.0),
        width: double.infinity,
        height: bottomHeight,
        decoration: BoxDecoration(
          color: Color(bottomContainerColor),
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.0), bottom: Radius.circular(0.0)),
        ),
      ),

    );
  }
}
