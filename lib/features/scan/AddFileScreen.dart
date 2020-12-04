
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/home/Home.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'CustomDialog.dart';
import 'ShareDialog.dart';

List<String> itemsList = ["Add New Patient", "Diana", "Jimmy", "Mark", "tatiana"];

class AddFileScreen extends StatefulWidget {
  var _image;

  AddFileScreen(this._image);

  @override
  State<StatefulWidget> createState() {
    return AddFileScreenState();
  }
}

class AddFileScreenState extends State<AddFileScreen> {

  TextEditingController _idController = new TextEditingController();
  TextEditingController _patientController = new TextEditingController();
  TextEditingController _documentTypeController = new TextEditingController();
  TextEditingController _docNameController = new TextEditingController();
  TextEditingController _folderNameController = new TextEditingController();
  TextEditingController _linkController = new TextEditingController();
  TextEditingController _notesController = new TextEditingController();
  TextEditingController _shareController = new TextEditingController();
  String selectedPatients = "";

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<String>> getCustomDropDownItems(List<String>data) {
    List<DropdownMenuItem<String>> list = List<DropdownMenuItem<String>>();
    for (int i = 0; i < itemsList.length; i++) {
      if (i == 0) {
        list.add(DropdownMenuItem<String>(
          //  value: data[i],
          child: Row(
            children: <Widget>[
              Icon(Icons.add, color: VIOLET_BLUE,),
              GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Add New Patient",
                        description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        buttonText: "Proceed",
                      ),
                    );
                  },
                  child: Text(data[i]))
            ],
          ),



        ));
      }
      else {
        list.add(DropdownMenuItem<String>(
          value: data[i],
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('images/termsCondition.png'),
              )
              , Text(data[i]),
            ],
          ),


        ));
      }
    }
    return list;
  }

  Widget getDrobDownMenue(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 44.0, right: 20),
          margin: EdgeInsets.only(left: 16.0, right: 16.0),

          decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.all(
                Radius.circular(20.0) //         <--- border radius here
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              ),
            ],
          ),
          // color: Colors.white,
          alignment: Alignment.center,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.9,
          height: MediaQuery
              .of(context)
              .size
              .height * .07,
          child: selectedPatients != null && selectedPatients.length != 0
              ? DropdownButton<String>(
              isExpanded: true,
              value: selectedPatients,
              iconEnabledColor: VIOLET_BLUE,

              underline: Container(
                color: Colors.white,
              ),
              hint: Text(
                "Patient Name & ID",
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              style: TextStyle(color: appColor),
              onChanged: (String newValue) {
                if (newValue != "Add New Patient") {
                  setState(() {
                    selectedPatients = newValue;
                  });
                }
              },
              items: getCustomDropDownItems(itemsList)

          )
              : DropdownButton<String>(
              isExpanded: true,
              iconEnabledColor: VIOLET_BLUE,

              underline: Container(
                color: Colors.white,
              ),
              hint: Text(
                "Patient Name & ID",
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              style: TextStyle(color: appColor),
              onChanged: (String newValue) {
                setState(() {
                  selectedPatients = newValue;
                });
              },
              items: getCustomDropDownItems(itemsList)

          )),
      Container(
        margin: EdgeInsets.only(top: 10, left: 28.0),
        color: backgroundColor,
        child: Icon(
          Icons.person,
          color: appColor,
          size: 20.0,
        ),
      ),
    ]);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0.0,
          title:Text("Add Document Details",style:TextStyle(color:titleColor)),
//            centerTitle: true,
          leading: new IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color:  Color(0xff852D91),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .03),
              child: Card(
                clipBehavior: Clip.hardEdge,
                color: WHITE,
                shape: RoundedRectangleBorder(
                  side: BorderSide( width: 6,color: WHITE),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  height: MediaQuery.of(context).size.height *0.2,
                  width:  MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                      shape: BoxShape.rectangle,
                      image:  DecorationImage(
                        fit: BoxFit.fill,
                        image:  widget._image == null
                            ? AssetImage("images/scan.png")
                            : FileImage(widget._image),
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05),
              child: getTextField(_idController,TextInputType.number,"36283628369634",Icons.confirmation_number,1),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .05),
                child:
                getDrobDownMenue(context)

              //   getTextField(_patientController,TextInputType.text,"Patient Name & ID",Icons.person,1),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05),
              child: getTextField(_documentTypeController,TextInputType.number,"Document Type",Icons.transform,1),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05),
              child: getTextField(_docNameController,TextInputType.text,"Document Name",Icons.note_add,1),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05),
              child: getTextField(_folderNameController,TextInputType.text,"Folder Name",Icons.folder_open,1),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05),
              child:Stack(
                children: <Widget>[
                  getTextField(_linkController,TextInputType.text,"Additional Link",Icons.insert_link,1)
                  ,
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Align(
                      alignment: Alignment.bottomCenter,

                      child: FlatButton(
                          onPressed: () {

                          },
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                                color: GRAY,
                                child: Icon(Icons.add,color: RED,)),
                          )),
                    ),
                  ),
                ],



              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05),
              child: getTextField(_notesController,TextInputType.text,"Notes (if any)",Icons.note,4),
            ),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ShareDialog(

                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .05),
                child: GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => ShareDialog(

                      ),
                    );
                  },
                    child: getTextField(_shareController,TextInputType.text,"Share With (enter email address)",Icons.group_add,1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .1,left: 20, right: 20,bottom: 20),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  onPressed: () {
                                      return Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Home()),
                                      );
                  },
                  color: appColor,
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .01,bottom:  MediaQuery.of(context).size.width * .01),
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel",
                    style: TextStyle(
                        color: appColor,
                        fontSize: 17.0)),
              ),
            )
          ],
        )
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