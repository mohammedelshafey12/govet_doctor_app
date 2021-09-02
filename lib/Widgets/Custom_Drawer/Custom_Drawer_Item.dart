import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  CustomDrawerItem({
    required this.imageUrl,
    required this.itemTitle,
    required this.onTap,
  });

  final String imageUrl;
  final String itemTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imageUrl,
        width: 30,
        fit: BoxFit.cover,
      ),
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
