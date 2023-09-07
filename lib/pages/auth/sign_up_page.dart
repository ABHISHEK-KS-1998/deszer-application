import 'package:deszer_application1/utlis/colors.dart';
import 'package:deszer_application1/widgets/app_text_field.dart';
import 'package:deszer_application1/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utlis/dimensinons.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages =[
      'f.png',
      'g.png',
      't.png'
    ];

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
            //email
            AppTextField(textController: emailController, hintText: 'Email', icon: Icons.email),
            SizedBox(height: Dimensions.height20),
            //password
            AppTextField(textController: passwordController, hintText: 'Password', icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20),
            //name
            AppTextField(textController: nameController, hintText: 'Name', icon: Icons.person),
            SizedBox(height: Dimensions.height20),
            //phone
            AppTextField(textController: phoneController, hintText: 'Phone', icon: Icons.phone),
            SizedBox(height: Dimensions.height20+Dimensions.height20),
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.maincolor
              ),
              child: Center(
                child: BigText(text: "Sign-up",
                size: Dimensions.font20+Dimensions.font20/2,
                color: AppColors.whitecolor),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            //tag line
            //text can be used as button bt using this widgit
            RichText(
                text: TextSpan(
              recognizer:TapGestureRecognizer()..onTap=()=>Get.back() ,
              text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                  )
            )
            ),
            SizedBox(height: Dimensions.screenHeight*0.05),
            //signup options
            RichText(
                text: TextSpan(
                    text: "Sign Up using one of fallowing methods",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16
                    )
                )
            ),
            Wrap(
              children:
              List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: Dimensions.radius30,
                  backgroundImage:AssetImage(
                    'assets/images/'+signUpImages[index]
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
