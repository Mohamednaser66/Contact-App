import 'dart:io';

import 'package:contact_app/core/app_color.dart';
import 'package:contact_app/core/images_manager.dart';
import 'package:contact_app/widget/contact.dart';
import 'package:contact_app/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ModalBottomSheet extends StatefulWidget {
  ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // dynamic padding for keyboard
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      ImagePicker picker = ImagePicker();
                      var imageFile = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (imageFile != null) {
                        image = File(imageFile.path);
                        setState(() {

                        });
                      }
                    },
                    child: SizedBox(
                      height: size.height * 0.15,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          child:
                              image == null
                                  ? Lottie.asset(ImagesManager.imagesPicture)
                                  : ClipRRect( borderRadius: BorderRadius.circular(16),
                                  child: Image.file(image!, fit: BoxFit.fill)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.light, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListenableBuilder(
                        listenable: nameController,
                        builder: (context, value) {
                          return Text(
                            nameController.text.isEmpty
                                ? 'Enter User Name '
                                : nameController.text,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.white,
                            ),
                          );
                        },
                      ),
                      Text(
                        '-----------------------',
                        style: TextStyle(color: AppColor.white),
                      ),
                      ListenableBuilder(
                        listenable: emailController,
                        builder:
                            (context, child) => Text(
                              emailController.text.isEmpty
                                  ? 'Enter Email'
                                  : emailController.text,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColor.white,
                              ),
                            ),
                      ),
                      Text(
                        '-----------------------',
                        style: TextStyle(color: AppColor.white),
                      ),
                      ListenableBuilder(
                        listenable: phoneController,
                        builder: (context, value) {
                          return Text(
                            phoneController.text.isEmpty
                                ? 'Enter User phone '
                                : phoneController.text,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hint: 'Enter User Name ',
                controller: nameController,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'invalid input';
                  } else if (value.length < 4) {
                    return 'value shouid be more than 3 char';
                  } else
                    return null;
                },
              ),
              CustomTextFormField(
                hint: 'Enter User Email ',
                controller: emailController,
                validation: (email) {
                  if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(email!)) {
                    return 'invalid email';
                  }
                },
              ),
              CustomTextFormField(
                hint: 'Enter User Phone',
                controller: phoneController,
                validation: (value) {
                  if (!RegExp(
                    r"^(\+201|01|00201)[0-2,5]{1}[0-9]{8}",
                  ).hasMatch(value!)) {
                    return 'invalid phone';
                  }
                },
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColor.gold,
                  foregroundColor: AppColor.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    if(image ==null){
                      return;
                    }
                    Contact modal =Contact(name: nameController.text, email: emailController.text, phone: phoneController.text, images: image!);
                    Contact.contacts.add(modal);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Enter user',
                  style: TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
