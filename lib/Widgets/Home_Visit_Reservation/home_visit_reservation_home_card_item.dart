import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeVisitReservationHomeCardItem extends StatelessWidget {
  const HomeVisitReservationHomeCardItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final title;
  final icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          shadowColor: Constants.primary_blue_color.withOpacity(0.5),
          elevation: 10.0,
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {
              onTap();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: height * 0.1,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
