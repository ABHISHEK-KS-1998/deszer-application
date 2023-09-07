import 'dart:ffi';

import 'package:deszer_application1/pages/auth/sign_up_page.dart';
import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/widgets/app_text_field.dart';
import 'package:deszer_application1/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utlis/dimensinons.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05),
            //app logo
            Container(
              height: Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius:Dimensions.radius20*4 ,
                  backgroundImage: AssetImage(
                    'assets/images/logo.1.png',
                  ),
                ),
              ),
            ),
            //welcom
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",style: TextStyle(
                    fontSize: Dimensions.font20*3+Dimensions.font20/2,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text("Sign-in to your account",style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.grey[600]
                      //fontWeight: FontWeight.bold
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            //email
            AppTextField(textController: emailController, hintText: 'Email', icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            //password
            AppTextField(textController: passwordController, hintText: 'Password', icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                    text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20
                        )
                    )
                ),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
                        //tag line
            SizedBox(height: Dimensions.screenHeight*0.05),
            //Signin
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.maincolor
              ),
              child: Center(
                child: BigText(text: "Sign-in",
                    size: Dimensions.font20+Dimensions.font20/2,
                    color: AppColors.whitecolor),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05),
            //signup options
            //text can be used as button bt using this widgit
            //used to wrap two text in one line
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account? ",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: Dimensions.font16
                    ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage()),
                    text: " Create ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: AppColors.mainblackcolor,
                        fontSize: Dimensions.font20
                    ),),
                  ]
                )
            ),
          ],
        ),
      ),
    );
  }
}
