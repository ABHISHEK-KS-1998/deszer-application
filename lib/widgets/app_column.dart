import 'package:deszer_application1/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utlis/colors.dart';
import '../utlis/dimensinons.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.maincolor,
                    size: 15,
                  )),
            ),
            SizedBox(width: 10),
            SmallText(text: '4.5'),
            SizedBox(width: 10),
            SmallText(text: '1287'),
            SizedBox(width: 10),
            SmallText(text: 'Comments'),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconcolor1),
            const SizedBox(width: 10),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: AppColors.maincolor),
            const SizedBox(width: 10),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '35min',
                iconColor: AppColors.iconcolor2),
          ],
        )
      ],
    );
  }
}
