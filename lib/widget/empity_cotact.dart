import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_color.dart';
import '../core/images_manager.dart';

class EmptyContact extends StatelessWidget {
  const EmptyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Lottie.asset(ImagesManager.empty),
        Text(
          'There is No Contacts Added Here',
          style: TextStyle(
            color: AppColor.gold,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
