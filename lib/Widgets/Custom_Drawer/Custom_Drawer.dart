import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_doctor_app/constants.dart';
import 'LogoutAlertDialog.dart';
import 'Custom_Drawer_Header.dart';
import 'Custom_Drawer_Item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    @required this.userName,
    @required this.userEmail,
    @required this.userImageUrl,
  });

  final userName;
  final userEmail;
  final userImageUrl;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          CustomDrawerHeader(
            profileImage: widget.userImageUrl,
            userName: widget.userName,
            userEmail: widget.userEmail,
          ),
          // SignOut Tile
          CustomDrawerItem(
            imageUrl: '',
            itemTitle: 'Sign Out',
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => CustomDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
