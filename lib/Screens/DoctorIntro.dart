import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govet_doctor_app/Screens/Doctor/VideoCall.dart';
import '../constants.dart';
import 'Home_Screen/home_screen.dart';

class DoctorIntro extends StatelessWidget {
  const DoctorIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Constants.primary_blue_color,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi',style: TextStyle(fontSize: width * 0.13,color: Constants.primary_yellow_color,fontFamily: 'custom_font'),),
                      Text('Doctor,',style: TextStyle(fontSize:  width * 0.13,color: Constants.primary_yellow_color,fontFamily: 'custom_font'),),
                    ],
                  ),
                ),
                Image.asset(Constants.doctorwithdog,width: width * 0.7,),
                Text('Let\'s get to work,',style: TextStyle(fontSize:  width * 0.07,color: Constants.primary_yellow_color,fontFamily: 'custom_font'),),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.primary_yellow_color,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )
                    ),
                    width: width * 0.5,
                    height: height * 0.08,
                    child: Center(child: Text('START',style: TextStyle(fontSize:  width * 0.09,color: Colors.white,fontFamily: 'custom_font_bold'),)),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
