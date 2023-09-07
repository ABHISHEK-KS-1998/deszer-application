import 'package:deszer_application1/utlis/dimensinons.dart';
import 'package:deszer_application1/widgets/big_text.dart';
import 'package:deszer_application1/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../../utlis/colors.dart';
import 'cake_page_body.dart';

class MainCakePage extends StatefulWidget {
  const MainCakePage({super.key});

  @override
  State<MainCakePage> createState() => _MainCakePageState();
}

class _MainCakePageState extends State<MainCakePage> {
  @override
  Widget build(BuildContext context) {
    //to know the width of the screen
   // print('width of the screen'+MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height60, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width15, right: Dimensions.width15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'India', color: AppColors.maincolor),
                      Row(
                        children: [
                          SmallText(
                            text: 'Mysore',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height:Dimensions.width45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.maincolor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size:Dimensions.iconsize30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //showing the body
         Expanded(
              child: SingleChildScrollView(
            child: CakePageBody(),
          )),
        ],
      ),
    );
  }
}
