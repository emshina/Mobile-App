import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const MyDrawerTile({super.key,required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(text, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight:FontWeight.bold),),
      horizontalTitleGap: 30,
      leading: Icon(icon, color: Theme.of(context).colorScheme.onPrimary, size: 20,),
      onTap: onTap,
    );
  }
}
