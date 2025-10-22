import 'package:contact_app/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, required this.controller,required this.validation});
  final String hint;
  final TextEditingController controller;
 final String? Function(String?)? validation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autofocus: true,
          autovalidateMode:AutovalidateMode.onUserInteraction,
          validator: validation,
          controller: controller ,
          style:TextStyle(color: AppColor.light,fontWeight: FontWeight.w400,fontSize: 16),
          cursorColor: AppColor.white,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColor.light,fontWeight: FontWeight.w400,fontSize: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.gold),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.gold),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red),
            ),

          ),


        ),
        SizedBox(height: 8,)
      ],
    );
  }
}
