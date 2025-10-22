import 'dart:io';

import 'package:contact_app/core/app_color.dart';
import 'package:contact_app/widget/contact.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({super.key, required this.contact,required this.onDelete});
final Contact contact;
final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: AppColor.gold,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.file(contact.images,fit:  BoxFit.cover,)),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email),
                      Text(contact.email,style:  TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.darkBlue),overflow: TextOverflow.ellipsis,)
                    ],

                  ),
                  Row(
                    children: [
                      Icon(Icons.phone,weight: 10,),
                      Text(contact.phone,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.darkBlue),),

                    ],

                  ),
                  SizedBox(height: 24,
                    child: FilledButton.icon(

                      style: FilledButton.styleFrom(

                          backgroundColor: Colors.red,
                          foregroundColor: AppColor.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                      onPressed: (){
                        onDelete();
                      }, label: Text('delete'),icon: Icon(Icons.delete),),

                  ),
                  SizedBox(height: 10,)
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
            margin:EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: AppColor.gold,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Text(contact.name),
          )
        ],
      ),
    );
  }
}
