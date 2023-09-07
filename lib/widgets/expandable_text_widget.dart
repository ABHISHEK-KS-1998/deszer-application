import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utlis/dimensinons.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText= true;


  double textHeight = Dimensions.screenHeight/5.35; //150
  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else {
      firstHalf=widget.text;
      secondHalf='';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.paracolor,size: Dimensions.font16,text: firstHalf):Column(
        children: [
          SmallText(height: 1.6,color: AppColors.paracolor,size: Dimensions.font16,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf) ),
          InkWell(
            onTap: (){
              setState((){
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Read more",color: AppColors.maincolor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.maincolor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
