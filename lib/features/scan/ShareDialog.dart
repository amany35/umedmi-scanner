import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class ShareDialog extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        color: WHITE,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50,),
            Icon(
              Icons.lock_open,
              size: 100,
            ),
            SizedBox(height: 20,),

            Text("This Section is Locked"),
            SizedBox(height: 20,),
            Text("Invite and  unlash",style: TextStyle(color: VIOLET_BLUE),),
            SizedBox(height: 20,),

            Text("dyl;ads,lkndasdlfjnas.mfd"),
            SizedBox(height: 20,),

            getTextField(TextEditingController(),TextInputType.text,"Name",null,1),
            SizedBox(height: 20,),

            getTextField(TextEditingController(),TextInputType.text,"Phone Number",null,1),
            SizedBox(height: 20,),
            getTextField(TextEditingController(),TextInputType.text,"Code Share",null,1),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  onPressed: () {
                    //                  return Navigator.push(
                    //                  context,
                    //                  MaterialPageRoute(builder: (context) => LoginScreen()),
                    //                  );
                  },
                  color: appColor,
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget getTextField(TextEditingController controller,
      TextInputType textInputType, String txt, IconData icon, int lines) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25.7),
        shadowColor: Colors.white,
        child: TextField(
          maxLines: lines,
          controller: controller,
          keyboardType: textInputType,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: txt,
            prefixIcon: new Icon(icon, color: appColor),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ),
      ),
    );
  }


}