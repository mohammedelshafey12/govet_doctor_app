import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:govet_doctor_app/constants.dart';
import '../Loading_Page.dart';
import 'LogoutAlertDialog.dart';
import 'Custom_Drawer_Header.dart';
import 'Custom_Drawer_Item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    @required this.docId,
  });

  final docId;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(Constants.doctorCollection)
              .where(Constants.doctorId, isEqualTo: widget.docId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              var doctorData = snapshot.data!.docs[0];
              return ListView(
                children: [
                  CustomDrawerHeader(
                    profileImage: '${doctorData[Constants.doctorImageUrl]}',
                    userName: doctorData[Constants.doctorName],
                    userEmail: doctorData[Constants.doctorEmail],
                  ),
                  CustomDrawerItem(
                    icon: Icons.notifications,
                    itemTitle: 'Notification',
                    onTap: () {

                    },
                  ),
                  CustomDrawerItem(
                    icon: Icons.person,
                    itemTitle: 'Your Home Visit',
                    onTap: () {

                    },
                  ),
                  Divider(),
                  CustomDrawerItem(
                    icon: Icons.logout,
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
              );
            } else {
              return LoadingPage();
            }
          }),
    );
  }
}
