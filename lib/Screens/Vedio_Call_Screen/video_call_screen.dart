import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Widgets/Loading_Page.dart';
import 'package:govet_doctor_app/Widgets/Video_Call/video_call_card_item.dart';

import '../../constants.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  String doctorName='';
  String doctorId='';
  String userOsId='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? userAuth = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection(Constants.doctorCollection)
        .where(Constants.doctorId, isEqualTo: userAuth!.uid)
        .get()
        .then((value) {
      setState(() {
        doctorName = value.docs[0][Constants.doctorName];
        doctorId = value.docs[0][Constants.doctorId];
        userOsId = value.docs[0][Constants.userOsId];
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(Constants.videoCallCollection).where(Constants.isVerify, isEqualTo: false).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!.docs;
            return ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return VideoCallCardItem(data: data[index],docId: data[index].reference.id,doctorName: doctorName,doctorId: doctorId,userOsId:userOsId);
              },
            );
          }else{
            return LoadingPage();
          }
        }
    );
  }
}