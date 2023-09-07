import 'package:deszer_application1/utlis/dimensinons.dart';
import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {super.key,
      this.color =const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overFlow =
          TextOverflow.ellipsis //to represent the dots in case of text overflow
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,  //to restrict lines
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          fontSize:size==0? Dimensions.font20:size),
    );
  }
}
