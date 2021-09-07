import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeVisitReservationListTileItem extends StatelessWidget {
  const HomeVisitReservationListTileItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final title;
  final subTitle;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Constants.primary_blue_color,
              fontSize: 12
            ),
          ),
        ],
      ),
      title: Center(
        child: Text(
          subTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
              fontSize: 14
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      trailing: Icon(icon, color: Colors.grey[600],),
    );
  }
}
