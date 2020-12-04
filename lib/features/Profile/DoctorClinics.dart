
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'DoctorClinicsDetails.dart';

class DoctorClinics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DoctorClinicsState();
  }
}

class _DoctorClinicsState extends State<DoctorClinics> {

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final body = ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Image.asset(
              'images/clinicPicture.png',
              width: 70,
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorClinicsDetails()),
                    );
              },
              child: Container(
              margin: EdgeInsets.only(left: 2),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                    15.0) //         <--- border radius here
                ),
                boxShadow: [
                  BoxShadow(
                    color: SHADOW,
                    offset: Offset(0.0, 10.0), //(x,y)
                    blurRadius: 15.0,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width / 1.6,
              height: 110,
              child: Column(
                children: <Widget>[
                   Row(
                     children: <Widget>[
                       Text(
                         "Clinic Name",
                         style: TextStyle(
                             color: titleColor,
                             fontWeight: FontWeight.bold,
                             fontSize: 15.0),
                       ),
                       Container(
                         width: 8.0,
                         height: 8.0,
                         margin: EdgeInsets.only(left: 15, right: 2),
                         decoration: new BoxDecoration(
                           color: OPEN_GREEN,
                           shape: BoxShape.circle,
                         ),
                       ),
                       Text("Open Now",
                         style: TextStyle(
                           fontSize: 8,
                           color: OPEN_GREEN,
                           fontWeight: FontWeight.bold,
                         ),),
                     ],
                   ),
                  SizedBox(height: 10,),
                   Row(
                     children: <Widget>[
                       Container(
                         decoration: BoxDecoration(
                           color: greyColor,
                           border: Border.all(
                             color: greyColor,
                           ),
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(5.0),//
                             bottomLeft: Radius.circular(5.0),//        <--- border radius here
                           ),
                         ),
                         width: 17,
                         height: 18,
                         alignment: Alignment.center,
                         child: Icon(Icons.phone, size: 7, color: COVID_DASH,),
                       ),
                       Container(
                         margin: EdgeInsets.only(right:10),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(
                             color: greyColor,
                           ),
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(5.0),//
                             bottomRight: Radius.circular(5.0),//        <--- border radius here
                           ),
                         ),
                         width: 60,
                         height: 18,
                         alignment: Alignment.center,
                         child: Text("013265478103",
                           style: TextStyle(
                             color: titleColor,
                             fontSize: 8.0),),
                       ),
                       Container(
                         decoration: BoxDecoration(
                           color: greyColor,
                           border: Border.all(
                             color: greyColor,
                           ),
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(5.0),//
                             bottomLeft: Radius.circular(5.0),//        <--- border radius here
                           ),
                         ),
                         width: 17,
                         height: 18,
                         alignment: Alignment.center,
                         child: Icon(Icons.phone, size: 7, color: COVID_DASH,),
                       ),
                       Container(
                         decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(
                             color: greyColor,
                           ),
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(5.0),//
                             bottomRight: Radius.circular(5.0),//        <--- border radius here
                           ),
                         ),
                         width: 60,
                         height: 18,
                         alignment: Alignment.center,
                         child: Text("013265478103",
                           style: TextStyle(
                               color: titleColor,
                               fontSize: 8.0),),
                       ),
                     ],
                   ),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: greyColor,
                          border: Border.all(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),//
                            bottomLeft: Radius.circular(5.0),//        <--- border radius here
                          ),
                        ),
                        width: 17,
                        height: 18,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/googleMap.png',
                          width: 7,
                          height: 8,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),//
                            bottomRight: Radius.circular(5.0),//        <--- border radius here
                          ),
                        ),
                        width: 90,
                        height: 18,
                        alignment: Alignment.center,
                        child: Text("View on Google Maps",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 8.0),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  ),
          ],
        )
      ],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: body,
      ),
    );
  }
}
