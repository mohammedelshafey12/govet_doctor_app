import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Widgets/Video_Call/video_call_card_item.dart';

import '../../constants.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return VideoCallCardItem();
      },
    );
  }
}
