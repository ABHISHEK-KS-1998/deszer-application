import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/utlis/dimensinons.dart';
import 'package:deszer_application1/widgets/big_text.dart';
import 'package:flutter/material.dart';

import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;

  AccountWidget({super.key,required this.appIcon,required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whitecolor,
        boxShadow: [
          BoxShadow(
            offset:Offset(0,2),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 1,
          )
        ]
      ),
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20,),
          bigText
        ],
      ),
    );
  }
}
