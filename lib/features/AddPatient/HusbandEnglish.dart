import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientDataScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'AddPatientScreen.dart';




class HusbandEnglish extends StatefulWidget {
  @override
  _HusbandEnglishState createState() => _HusbandEnglishState();
}

class _HusbandEnglishState extends State<HusbandEnglish> {

  var Names = ["Page Whiteman","Julia Peterson","Peter Doorman",
    "George Williams","Fola Oraby","Hanfy Elobha","April Oman","Sandy Johnson"];


  @override
  Widget build(BuildContext context) {

    final String imageUrl =
        "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";



    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    itemWidget(position){

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height/100,),
          GestureDetector(
            onTap: (){


              husbandenglish_showwidget = true;

              return husbandenglish_showwidget;

              setState(() {

              });


            },
            child: Container(
              height:MediaQuery.of(context).size.height*0.07,
//                            width: MediaQuery.of(context).size.width,
              child: ListTile(
                leading:Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(imageUrl),
                  ),
                ),
                title: Text(Names[position],style: TextStyle(color: titleColor),),
                subtitle: Text("M.23.Diabetic"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    position%5==0?Tab(
                      child: Image.asset("images/sharedPatientsIcon.png"),
                    ):Text(""),

                    SizedBox(width: width/15,),

                    Tab(
                      child: Icon(Icons.bookmark),
                    ),
                  ],
                ),
              ),),
          ),
          SizedBox(height: height/100,),
          Divider(),
        ],
      );

    }



    return Padding(
      padding: EdgeInsets.only(bottom: height/50),
      child: Container(
        height: height/3,
        width: width/1.1,
        decoration: new BoxDecoration(
          color: searchbarIconColor.withOpacity(.3),

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: ListView.builder(
                  itemCount: Names.length,
                  itemBuilder:(context,position){

                    return husbandName!=null?Names[position].contains(husbandName)?itemWidget(position):Text(""):itemWidget(position);


                  }



              ),


      ),
    );
  }
}
