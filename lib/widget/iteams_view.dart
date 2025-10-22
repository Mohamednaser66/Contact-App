import 'package:contact_app/widget/contact.dart';
import 'package:contact_app/widget/item_card.dart';
import 'package:flutter/material.dart';

class IteamsView extends StatefulWidget {
  const IteamsView({super.key});

  @override
  State<IteamsView> createState() => _IteamsViewState();
}

class _IteamsViewState extends State<IteamsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(itemCount: Contact.contacts.length
      ,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7),
        itemBuilder:(context, index) => ItemCard(contact: Contact.contacts[index],
          onDelete: (){
          Contact.contacts.removeAt(index);
          setState(() {

          });
          })),
    );
  }
}