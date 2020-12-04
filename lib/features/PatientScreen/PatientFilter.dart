import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientDataScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class PatientFilter extends StatefulWidget {
  @override
  _PatientFilterState createState() => _PatientFilterState();
}

class _PatientFilterState extends State<PatientFilter> {

  TextEditingController filterController= TextEditingController();

  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";



  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        elevation: 0,
        toolbarHeight: height/6,
        leading: Padding(
          padding: EdgeInsets.only(top: height/50),
          child:  Text(" Filter",style: TextStyle(color: fontColor,
              fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.start,),

        ),

        title: Container(
          width: width/1.5,
          height: height/15,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: searchbarIconColor.withOpacity(.3),
            border: Border.all(
                color: searchbarIconColor,
                width: 2.0
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(50.0)  //                 <--- border radius here
            ),


          ),

          child: Center(
            child: ListTile(

              title: TextFormField(
                controller: filterController,
                textAlign: TextAlign.center,
                maxLines: 1,
                validator: (value){

                    filterController.text=value;

                    return filterController.text;


                },
                decoration: InputDecoration(
                    hintText: "Critical",
                    hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
                    border: InputBorder.none
                ),
              ),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  

                  GestureDetector(

                    onTap: (){

                      setState(() {

                      });

                    },

                      child: Image.asset("images/filter.png",color: primaryColor,width: width/30,))


                ],

              ),

            ),
          ),

        ),

      ),
      body: filterController.text!="###"?ListView.builder(
        itemCount: 2,
        itemBuilder: (context,position){

          return Container(
            height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: (){
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientDataScreen()),
                );
              },
              leading:Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircularImage(
                  NetworkImage(imageUrl),
                ),
              ),
              title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
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
            ),);

        },

      ):Center(
        child: Padding(
          padding:EdgeInsets.symmetric(vertical: height/40,horizontal: width/20),
          child: ListView(
            children: [
              Container(
    width: width/1.5,
    height: height/8,
    alignment: Alignment.center,
    decoration: new BoxDecoration(
              color: Colors.red,
    border: Border.all(
    color: Colors.red,
    width: 2.0
    ),
    borderRadius: BorderRadius.all(
    Radius.circular(20.0)  //                 <--- border radius here
    ),

    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
      child: Text("Oops, Filter not Found !! Try Search another filter",style: TextStyle(fontSize: 15,color: accentColor),),
    ),
    ),


            SizedBox(height: height/20,),


            Image.asset("images/question.png",width: width/1.5,),

            ],
          ),
        ),
      ));
  }
}
