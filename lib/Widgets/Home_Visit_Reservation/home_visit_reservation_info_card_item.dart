import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeVisitReservationInfoCardItem extends StatelessWidget {
  const HomeVisitReservationInfoCardItem({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final title;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        shadowColor: Constants.primary_blue_color.withOpacity(0.5),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Constants.primary_blue_color,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          title: Text(
            subTitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(
            Icons.info_outline,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
