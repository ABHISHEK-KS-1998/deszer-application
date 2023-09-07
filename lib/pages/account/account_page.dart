import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/utlis/dimensinons.dart';
import 'package:deszer_application1/widgets/account_widgets.dart';
import 'package:deszer_application1/widgets/app_icon.dart';
import 'package:deszer_application1/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: BigText(
            text: 'Profile',
            size: 24,
            color: AppColors.whitecolor,
          )),
          backgroundColor: AppColors.maincolor,
        ),
        body: Container(
          margin: EdgeInsets.only(top: Dimensions.height20),
          width: double.maxFinite,
          child: Column(
            children: [
              //profile icon
              AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.maincolor,
                iconColor: AppColors.whitecolor,
                iconsize: Dimensions.height15*5,
                size: Dimensions.height30*5,
              ),
              SizedBox(height: Dimensions.height20),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //name
                      AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.maincolor,
                            iconColor: AppColors.whitecolor,
                            iconsize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,
                          ),
                          bigText: BigText(text: 'yunus',)),
                      SizedBox(height: Dimensions.height20,),
                      //phone
                      AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.phone,
                            backgroundColor: AppColors.yellowcolor,
                            iconColor: AppColors.whitecolor,
                            iconsize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,
                          ),
                          bigText: BigText(text: '1234567890',)),
                      SizedBox(height: Dimensions.height20,),
                      //email
                      AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.email,
                            backgroundColor: AppColors.yellowcolor,
                            iconColor: AppColors.whitecolor,
                            iconsize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,
                          ),
                          bigText: BigText(text: 'abcd@gmail.com',)),
                      SizedBox(height: Dimensions.height20,),
                      // address
                      AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.location_on,
                            backgroundColor: AppColors.yellowcolor,
                            iconColor: AppColors.whitecolor,
                            iconsize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,
                          ),
                          bigText: BigText(text: 'Fill in your address',)),
                      SizedBox(height: Dimensions.height20,),
                      //message
                      AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.message,
                            backgroundColor: Colors.redAccent,
                            iconColor: AppColors.whitecolor,
                            iconsize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,
                          ),
                          bigText: BigText(text: 'More',)),
                      SizedBox(height: Dimensions.height20,),
                      //
                      AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.login_outlined,
                            backgroundColor: Colors.redAccent,
                            iconColor: AppColors.whitecolor,
                            iconsize: Dimensions.height10*5/2,
                            size: Dimensions.height10*5,
                          ),
                          bigText: BigText(text: 'Log Out',)),
                    ],
                  ),
                ),
              )


            ],
          ),
        ));
  }
}
