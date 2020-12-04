import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/Profile/DoctorProfileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class AccountCreated extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AccountCreatedState();
  }
}

class _AccountCreatedState extends State<AccountCreated> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final completeProfileButton = Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DoctorProfileScreen()),
          );
        },
        color:appColor,
        child: Text("Complete Your Profile",
            style: TextStyle(color: Colors.white, fontSize: 12.0)),
      ),
    );



    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Image(
                image: AssetImage('images/success_bg.png'),
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            Text("Account Created Successfully",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: completeProfileButton,
            ),
//            Padding(
//              padding: EdgeInsets.only(
//                  top: MediaQuery.of(context).size.height * 0.2),
//              child: skipButton,
//            ),
          ],
        ),
      ),
    );
  }
}
