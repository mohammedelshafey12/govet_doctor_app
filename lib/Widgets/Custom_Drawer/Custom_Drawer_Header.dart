import 'package:flutter/material.dart';
import 'package:govet_doctor_app/constants.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    required this.profileImage,
    required this.userName,
    required this.userEmail,
  });

  final String profileImage;
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: profileImage == ''
                    ? Icon(
                        Icons.person,
                  size: width * 0.2,
                  color: Constants.primary_blue_color,
                      )
                    : Container(
                  width: width * 0.25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network(
                            profileImage,
                            fit: BoxFit.cover,
                          ),
                      ),
                    ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'custom_font',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userEmail,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'custom_font',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
