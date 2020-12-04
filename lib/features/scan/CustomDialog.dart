import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 399,
          padding: EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          margin: EdgeInsets.only(top: 15),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height *0.17,
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.17,
//                   width: double.infinity,
                        color:appColor,
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            child:Column(
                                children: <Widget>[
                                  Icon(Icons.add,color: WHITE,),
                                  SizedBox(height: 10,),
                                  Text("Add Manually",style:TextStyle(color:WHITE))
                                  ]
                            )
                            )
                        ),
                      ),
                    ),
                  )
                  ,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height *0.17,
//                   width: double.infinity,
                      color:appColor,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                          child:Column(
                            children:<Widget>[
                              Icon(Icons.center_focus_strong,color: WHITE),
                              SizedBox(height: 10,),
                              Text("Scan QR Code",style:TextStyle(color: WHITE)),
                            ]
                          )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText,style: TextStyle(color: appColor,fontSize: 14),),
                ),
              ),
            ],
          ),
        ),



      ],
    );
  }

}