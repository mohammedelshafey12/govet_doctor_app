import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomDrawerItem extends StatelessWidget {
  CustomDrawerItem({
    required this.icon,
    required this.itemTitle,
    required this.onTap,
  });

  final icon;
  final String itemTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Constants.primary_blue_color,),
      title: Text(
        itemTitle,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'custom_font',
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.black,
      ),
      onTap: () {}
    );
  }
}
