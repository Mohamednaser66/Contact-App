import 'package:contact_app/core/app_color.dart';
import 'package:contact_app/core/images_manager.dart';
import 'package:contact_app/widget/contact.dart';
import 'package:contact_app/widget/empity_cotact.dart';
import 'package:contact_app/widget/iteams_view.dart';
import 'package:contact_app/widget/modaL_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: Contact.contacts.isNotEmpty,
              child: FloatingActionButton(foregroundColor: AppColor.white,
                backgroundColor: Colors.red,
                onPressed:(){
                 Contact.contacts.removeLast();
                 setState(() {
                 });
                } ,child: Icon(Icons.delete),),
            ),
            SizedBox(height: 12,),
            Visibility(
              visible: Contact.contacts.length<6,
              child: FloatingActionButton(foregroundColor: AppColor.darkBlue,
                backgroundColor: AppColor.gold,
                onPressed:()async{
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: AppColor.darkBlue,
                    context: context, builder: (context) => ModalBottomSheet(),);
                } ,child: Icon(Icons.add),),
            ),
          ],
        ),
        backgroundColor: AppColor.darkBlue,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImagesManager.branding, height: size.height * 0.07),
              Contact.contacts.isEmpty ? EmptyContact() : IteamsView(),



            ],

          ),
        ),

      ),
    );
  }
}
