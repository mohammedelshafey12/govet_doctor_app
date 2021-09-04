import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/constants.dart';
import '../Loading_Page.dart';
import 'Custom_Drawer_Header.dart';
import 'Custom_Drawer_Item.dart';
import 'log_out_alert_dialog.dart';

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
                        builder: (context) => LogOutAlertDialog(),
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
