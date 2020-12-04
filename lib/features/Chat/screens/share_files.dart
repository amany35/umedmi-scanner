import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/Chat/screens/callnow.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class ShareFiles extends StatefulWidget {

  final String userPhotoUrl,userName;
  final List messageModel_List;

  const ShareFiles({Key key, this.userPhotoUrl, this.userName, this.messageModel_List}) : super(key: key);

  @override
  _ShareFilesState createState() => _ShareFilesState();
}

class _ShareFilesState extends State<ShareFiles> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(

          backgroundColor: accentColor,
          elevation: 0,
          toolbarHeight: height/20,
          centerTitle: true,


          title: Text("Share Files",style: TextStyle(fontSize: 18,color: fontColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

        leading:

        GestureDetector(

            onTap: (){

              Navigator.pop(context);


            },
            child: Text("Cancel",style: TextStyle(fontSize: 14,color: cancelBtnColor),textAlign: TextAlign.start,)),



      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
        child: Stack(

          children: [

             Container(
                width: width,
                height: height,
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context,position){

                      return Column(
                        children: [
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Folder Name",style: TextStyle(fontSize: 15,color: fontColor)),

                              Padding(
                                padding: EdgeInsets.only(top:width/20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,size: width/30,color: searchbarIconColor,),

                                  ),
                                ),
                              ),

                            ],

                          ),

                          Divider(),

                        ],
                      );


                    }),
              ),






            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top:height/50,bottom:height/80),
                child: GestureDetector(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>CallNow(userPhotoUrl: widget.userPhotoUrl,
                              userName: widget.userName,messageModel_List: widget.messageModel_List,isShareFile:true ,)
                        ));


                  },
                  child: Container(
                      width: width/1.3,
                      height: height/20,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),

                      child: Center(child: Text("Share",
                        textAlign: TextAlign.center,style: TextStyle(color: accentColor),))),
                ),
              ),
            ),






          ],



        ),
      ),

    );
  }
}
