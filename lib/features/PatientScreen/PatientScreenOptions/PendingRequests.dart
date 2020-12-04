import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientDataScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:umedmiscanner/resources/Styles.dart';

import 'RequestPatientDetails.dart';

class PendingRequests extends StatefulWidget {
  @override
  _PendingRequestsState createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {


  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";



  searchbar(width){

    return Container(

        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          border: Border.all(
              color: Colors.white.withOpacity(.1),
              width: 2.0
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(50.0)  //                 <--- border radius here
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],

        ),
        child: Center(
          child: ListTile(

            leading: Icon(Icons.search,color: searchbarIconColor,),

            title: TextField(
              decoration: InputDecoration(
                  hintText:"Search ...",
                  hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                  border: InputBorder.none

              ),
            ),

            trailing: Image.asset(
              "images/filter.png",
              color: appColor,
              width: width / 30,
            ),

          ),
        )
    );


  }


  patientCard(width,height,position){

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 1.0,
          ),
        ],
        color: accentColor,
      ),
      child: Stack(
        children: [
          ListTile(
            onTap: () {
              // return Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PatientDataScreen()),
              // );
            },
            leading: Padding(
              padding: const EdgeInsets.only(right: 2),
              child:
              CircularImage(
                NetworkImage(imageUrl,scale: width/40),
              ),


            ),
            // title: RichText(
            //   InlineSpan: Text(
            //     "Diana Rockwell",
            //     style: TextStyle(color: titleColor),
            //   ),
            // ),
            title: RichText(
              // overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 9.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Diana Rockwell",
                      style: TextStyle(fontWeight: FontWeight.bold,color: titleColor,fontSize: 9),
                    ),
                    TextSpan(
                      text: "\n(#2585693)",
                      style: TextStyle(fontWeight: FontWeight.bold,color: titleColor,fontSize: 9),
                    ),
                  ]

              ),

            ),
            subtitle: Text("M.23.Diabetic",style: TextStyle(fontSize: 8),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: null,
                  child: Image.asset(
                    "images/qr-code.png",
                    color: appColor,
                    width: width / 30,
                  ),
                ),
                SizedBox(
                  width: width / 15,
                ),
                position % 3 == 0
                    ? GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestPatientDetails()),
                    );
                  },
                  child: Container(
                      width: width/6,
                      height: height/20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Approved",style:TextStyle(fontSize: 8,color: Colors.white),textScaleFactor: 1,),
                      )
                  ),
                )
                    : position % 2 == 0
                    ? Container(
                    width: width/6,
                    height: height/20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Pending",style:TextStyle(fontSize: 8,color: Colors.white),textScaleFactor: 1,),
                    )
                ): Container(
                    width: width/6,
                    height: height/20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cancelBtnColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Declined",style:TextStyle(fontSize: 8,color: Colors.white),textScaleFactor: 1,),
                    )
                ),
                SizedBox(
                  width: width / 30,
                ),
                position%2==0?Tab(
                  child: Icon(Icons.bookmark, color: PROGRESS_COLOR,),
                ):Tab(
                  child: Icon(Icons.bookmark_border, color: PROGRESS_COLOR,),
                ),
              ],
            ),
          ),

          Positioned(
            left: width/40,
            top: height/50,

            child: CircleAvatar(
              radius: 4,
              backgroundColor: position%2==0?Colors.green:position%3==0?Colors.grey:Colors.red,

            ),
          ),


        ],

      ),
    );

  }

  backCard(){
    return Text("huii");
  }


  showPendingRequests(width,height){

    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return ExpandableNotifier(
              child:  ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment: ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: false,
                            //hasIcon: false,
                          ),
                          header: patientCard(width, height, position),

                          expanded:
                          Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          height: height/5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0),),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                            color: accentColor,
                          ),

                          child: ListView.builder(
                             itemCount: 5,
                            itemBuilder: (context,position){

                               return Container(
                                   margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0),),
                              boxShadow: [
                              BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                              ),
                              ],
                              color: accentColor,
                              ),
                                 child: ListTile(

                                   leading:Icon(Icons.radio_button_checked,size: width/30,color: appColor,),

                                   title: Container(
                                     height: height/10,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.1),
                                      borderRadius: BorderRadius.all(Radius.circular(20.0),),
                                      ),
                                     child: Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           mainAxisSize: MainAxisSize.min,
                                           children: [

                                             SizedBox(width: width/50,),

                                             // Icon(Icons.link,size: width/15,color: appColor,),
                                             //
                                             // SizedBox(width: width/50,),



                                             Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [


                                                 Text("URL Document",
                                                   style: TextStyle(fontWeight: FontWeight.bold,
                                                       fontSize: 10,color: fontColor),),

                                                 SizedBox(height: height/80,),

                                                 Text("Made on 20/02/2019",
                                                   style: TextStyle(fontWeight: FontWeight.bold,
                                                       fontSize: 8,color: searchbarIconColor),),

                                                 SizedBox(height: height/80,),

                                                 Text("URL : Lorem Loooot Lorem oki",
                                                   style: TextStyle(fontWeight: FontWeight.bold,
                                                       fontSize: 8,color: appColor),),
                                               ],
                                             ),



                                             SizedBox(width: width/50,),

                                             Text("2",style: TextStyle(fontSize: 10,color: appColor),),
                                             Icon(Icons.attach_file,size: width/30,color: appColor,),

                                             SizedBox(width: width/50,),

                                             Text("5",style: TextStyle(fontSize: 10,color: appColor),),
                                             Icon(Icons.group_outlined,size: width/30,color: appColor,),

                                             SizedBox(width: width/50,),


                                           ],
                                         ),

                                   ),


                                   trailing: Column(
                                     children: [

                                       Icon(Icons.flag,size: width/30,color: Colors.red,),

                                       SizedBox(height: height/40,),

                                       Container(
                                         width: width/10,
                                         height: height/40,
                                         child: FlutterSwitch(
                                           padding: 4.0,
                                           toggleSize: 20.0,
                                           borderRadius: 10.0,
                                           inactiveColor: switchinactiveColor,
                                           activeColor: Colors.red,
                                           value: true,
                                           onToggle: (value) {
                                             setState(() {
                                               //showSettingisSwitched_one= value;
                                             });
                                           },
                                         ),
                                       ),
                                     ],
                                   ),

                               ),

                               );


                            },



                          ),
                          )

                ),
              );
        },
      ),
    );

  }


  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(

      backgroundColor: accentColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: height/4.7,
        backgroundColor: accentColor,
        title: Text("List of Pending Requests :",style: TextStyle(color: fontColor),),
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
              child: searchbar(width),
            ),
            preferredSize: null),

        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 80, vertical: height / 80),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/close.png", color: appColor, width: width / 25,),



          ),
        ),

      ),

      body:
          showPendingRequests(width, height),





    );
  }
}
