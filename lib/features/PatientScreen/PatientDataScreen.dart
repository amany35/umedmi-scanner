import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/features/PatientScreen/ReferralsScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'InvestigationsScreen.dart';

class PatientDataScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PatientDataScreenState();
  }
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  bool doctorCheck = true,
      labCheck = false,
      radCheck = false,
      serviceCheck = false,
      interventionCheck = false, personalInfoCheck= false, investigationCheck= false,
      specialtiesCheck= false,referralsCheck= false, reportsCheck= false;

  double containerHeight = 0.55;
  TextEditingController doctorTextController = new TextEditingController();
  TextEditingController tagsTextController = new TextEditingController();
  TextEditingController notesTextController = new TextEditingController();
  int _countDoctorText = 1, _countDiagnosisText= 1;
  bool _obscureTextDiagnosis = false;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  void _toggleDiagnosis() {
    setState(() {
      _obscureTextDiagnosis = !_obscureTextDiagnosis;
    });
  }

  void _addNewDoctorText() {
    setState(() {
      _countDoctorText = _countDoctorText + 1;
    });
    Navigator.of(context).pop();
    showShareDialog();
  }
  void _addNewDiagnosisText() {
    setState(() {
      _countDiagnosisText = _countDiagnosisText + 1;
    });
    Navigator.of(context).pop();
    showDiagnosisDialog();
  }
  void showInsuredDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0))),
                    title: Center(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.hospital,
                              size: 30.0,
                              color: appColor,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'Medical Insurance',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        )),
                    content: Container(
                      color: backgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .33),
                            child:  Text(
                              'Insurance Status',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .01,
                                right: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .45),
                            child: Text(
                              'Insured',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .03,
                                right: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .3),
                            child: Text(
                              'Insurance Provider',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .01,
                                right: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .5),
                            child: Text(
                              'AXA',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .3),
                            child: Text(
                              'Insurance Duration',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .04),
                                child:Text(
                                  'Start Date',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .28),
                                child:Text(
                                  '1/2/2020',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .04),
                                child:Text(
                                  'End Date',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .28),
                                child:Text(
                                  '31/12/2020',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context)
                                    .size
                                    .width *
                                    .3),
                            child: Text(
                              'Insurance Coverage',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .04),
                                child:Text(
                                  'Pharmcy & Medications',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .1),
                                child:Text(
                                  'Fully Covered',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .04),
                                child:Text(
                                  'Laporatory',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .26),
                                child:Text(
                                  'Fully Covered',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .04),
                                child:Text(
                                  'Radiology',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .27),
                                child:Text(
                                  'Fully Radiology',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .04),
                                child:Text(
                                  'Surguries',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                        .size
                                        .width *
                                        .28),
                                child:Text(
                                  '50% Covered',
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Done",
                                style:
                                TextStyle(color: appColor)),
                          )
                        ],
                      ),
                    ));
              });
        });
  }
  void showDiagnosisDialog() {
    final diagnosisText = Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .08,
          right: MediaQuery.of(context).size.width * .08,
          top: MediaQuery.of(context).size.width * .06,),
      child: Stack(
        children: <Widget>[
          Material(
            elevation: 12.0,
            borderRadius: BorderRadius.circular(15),
            shadowColor: Colors.white,
            child: TextField(
              controller: doctorTextController,
              autofocus: false,
              obscureText: _obscureTextDiagnosis,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Diagnosis',
                hintStyle: TextStyle(fontSize: 10),
                prefixIcon: Container(
                  width: 10,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 8,),
                      new Icon(FontAwesomeIcons.notesMedical, color: appColor, size: 10,),
                      SizedBox(width: 8,),
                      Container(
                          width: 2,
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.black12,
                            width: 1,
                            thickness: 1,
                            endIndent: 0,
                          )),
                    ],
                  ),
                ),
                suffixIcon:  GestureDetector(
                  onTap: _toggleDiagnosis,
                  child: Icon(
                      _obscureTextDiagnosis
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: Colors.pinkAccent,
                      size: 12.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                  onPressed: () {
                    print("height + "+ containerHeight.toString());
                    _addNewDiagnosisText();
                    setState(() {
                      if(containerHeight <= 0.7)
                      containerHeight = containerHeight + 0.15;
                    });
                  },
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                        color: GRAY,
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.pinkAccent,
                          size:14.0,
                        )),
                  )),
            ),
          ),
        ],
      )
    );
    final tagsText = Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .08,
        vertical: MediaQuery.of(context).size.width * .02,),
      height: 40,
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.white,
        child: TextField(
          controller: tagsTextController,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Tags',
            hintStyle: TextStyle(fontSize: 10),
            prefixIcon: Container(
              width: 10,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 8,),
                  new Icon(FontAwesomeIcons.bookmark, color: appColor, size: 10,),
                  SizedBox(width: 8,),
                  Container(
                      width: 2,
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.black12,
                        width: 1,
                        thickness: 1,
                        endIndent: 0,
                      )),
                ],
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
    final notesText = Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .08,
        vertical: MediaQuery.of(context).size.width * .02,),
      height: 60,
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.white,
        child: TextField(
          controller: notesTextController,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Notes',
            hintStyle: TextStyle(fontSize: 10),
            prefixIcon: Container(
              width: 10,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 8,),
                  new Icon(FontAwesomeIcons.edit, color: appColor, size: 10,),
                  SizedBox(width: 8,),
                  Container(
                      width: 2,
                      height: 60,
                      child: VerticalDivider(
                        color: Colors.black12,
                        width: 1,
                        thickness: 1,
                        endIndent: 1,
                      )),
                ],
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
    List<Widget> _diagnosisTextList =
    new List.generate(_countDiagnosisText, (int i) => diagnosisText);
    showModalBottomSheet(
        //isScrollControlled:true,
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        context: context,
        builder: (BuildContext context) {
          return  Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: backgroundColor,
            ),
            height: MediaQuery.of(context).size.height * containerHeight,
            child: ListView(
              physics: (containerHeight <= 0.7) ? NeverScrollableScrollPhysics() : ScrollPhysics(),
              children: <Widget>[
                GestureDetector(
                onTap: () {
                  if(containerHeight >= 0.7) Navigator.of(context).pop();
          },
            child:Align(
            alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 2,bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0),),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
          color: SLIDE_MENU_COLOR,
          ),
              width: MediaQuery.of(context).size.width * .18,
              height: 5,
            ),
            ),
                ),
                Icon(
                  FontAwesomeIcons.notesMedical,
                  size: 30.0,
                  color: appColor,
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .41,),
                  child: Text(
                    'Diagnosis',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                  ),
                ),
                Column(
                  children: _diagnosisTextList,
                ),
                tagsText,
                notesText,
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Done",
                      style:
                      TextStyle(color: appColor)),
                )
              ],
            ),
          );
        });

  }
  void showShareDialog() {
    final shareButton = FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        title: Column(
                          children: <Widget>[
                            Text(
                              'This patient will be shared anonymously.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                            Text(
                              'Are You Sure?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                        content: Row(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel", style: TextStyle(color: Colors.black26)),
                            ),
                            SizedBox(width: 25,),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Confirm", style: TextStyle(color: appColor)),
                            ),
                          ],
                        ));
                  });
            });
      },
      child: Text("Share",
          style:
          TextStyle(color: appColor)),
    );

    final doctorText = Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .02),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.white,
        child: TextField(
          controller: doctorTextController,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Add Doctor/s Name',
            hintStyle: TextStyle(fontSize: 10),
            prefixIcon: Container(
              width: 10,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 5,),
                  new Icon(FontAwesomeIcons.users, color: appColor, size: 10,),
                  SizedBox(width: 5,),
                  Container(
                      width: 2,
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.black12,
                        width: 1,
                        thickness: 1,
                        endIndent: 0,
                      )),
                ],
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: _addNewDoctorText,
              child: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.pinkAccent,
                  size: 12.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );

    List<Widget> _doctorTextList =
    new List.generate(_countDoctorText, (int i) => doctorText);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0))),
                    title: Center(
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/share_patient.png'),
                              width: MediaQuery.of(context).size.width*0.1,
                              height:MediaQuery.of(context).size.width*0.1,
                            ),
                            Text(
                              'Share Patient',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        )),
                    content: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      color: backgroundColor,
                      child: ListView(
                        children: <Widget>[
                          Column(
                            children: _doctorTextList,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                //padding: EdgeInsets.only(left: 44.0),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                  right: MediaQuery.of(context).size.width * 0.04,
                                ),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //         <--- border radius here
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
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: MediaQuery.of(context).size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(
                              50.0), //         <--- border radius here
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height:20,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            right: MediaQuery.of(context).size.width * .1),
                                        child: Checkbox(
                                            checkColor: appColor,
                                            activeColor: appColor,
                                            value: personalInfoCheck,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                personalInfoCheck = newValue;
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Icon(
                                          FontAwesomeIcons.male,
                                          size: 15,
                                        ),
                                      ),
                                      Text(
                                        " Personal\nInformation",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.only(left: 44.0),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                  right: MediaQuery.of(context).size.width * 0.04,
                                ),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //         <--- border radius here
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
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: MediaQuery.of(context).size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(
                              50.0), //         <--- border radius here
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height:20,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            right: MediaQuery.of(context).size.width * .1),
                                        child: Checkbox(
                                            checkColor: appColor,
                                            activeColor: appColor,
                                            value: specialtiesCheck,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                specialtiesCheck = newValue;
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Icon(
                                          FontAwesomeIcons.stethoscope,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Text(
                                          "Specialties",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.only(left: 44.0),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //         <--- border radius here
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
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: MediaQuery.of(context).size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(
                              50.0), //         <--- border radius here
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height:20,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            right: MediaQuery.of(context).size.width * .1),
                                        child: Checkbox(
                                            checkColor: appColor,
                                            activeColor: appColor,
                                            value: interventionCheck,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                interventionCheck = newValue;
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Icon(
                                          FontAwesomeIcons.notesMedical,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Text(
                                          "Interventions",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                //padding: EdgeInsets.only(left: 44.0),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                  right: MediaQuery.of(context).size.width * 0.04,
                                ),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //         <--- border radius here
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
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: MediaQuery.of(context).size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(
                              50.0), //         <--- border radius here
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height:20,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            right: MediaQuery.of(context).size.width * .1),
                                        child: Checkbox(
                                            checkColor: appColor,
                                            activeColor: appColor,
                                            value: investigationCheck,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                investigationCheck = newValue;
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Icon(
                                          FontAwesomeIcons.userNurse,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child:  Text(
                                          "Investigation",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.only(left: 44.0),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                  right: MediaQuery.of(context).size.width * 0.04,
                                ),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //         <--- border radius here
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
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: MediaQuery.of(context).size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(
                              50.0), //         <--- border radius here
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height:20,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            right: MediaQuery.of(context).size.width * .1),
                                        child: Checkbox(
                                            checkColor: appColor,
                                            activeColor: appColor,
                                            value: referralsCheck,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                referralsCheck = newValue;
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Icon(
                                          FontAwesomeIcons.peopleCarry,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Text(
                                          "Referrals",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.only(left: 44.0),
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      20.0) //         <--- border radius here
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
                                width: MediaQuery.of(context).size.width * 0.18,
                                height: MediaQuery.of(context).size.width * 0.18,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(
                              50.0), //         <--- border radius here
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height:20,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            right: MediaQuery.of(context).size.width * .1),
                                        child: Checkbox(
                                            checkColor: appColor,
                                            activeColor: appColor,
                                            value: reportsCheck,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                reportsCheck = newValue;
                                              });
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Icon(
                                          FontAwesomeIcons.fileMedicalAlt,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height * .01),
                                        child: Text(
                                          "Reports",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          shareButton,
                        ],
                      ),
                    ));
              });
        });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final body = Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .06,
          vertical: 10),
      child: ListView(
        children: <Widget>[
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                ),
                padding: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(
                      20.0) //         <--- border radius here
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffE8E6F1),
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                width: width,
                height: height / 4,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.bookmark_border,
                        color: PROGRESS_COLOR,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        CircularImage(
                          NetworkImage(imageUrl),
                          width: 30,
                          height: 30,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "Milena Kafka (#206541)",
                                  style: TextStyle(
                                      color: titleColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width:5,),
                                GestureDetector(
                                  onTap: null,
                                  child: Image.asset(
                                    "images/qr-code.png",
                                    color: appColor,
                                    width: width / 30,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5),
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    color: POINTS_COLOR,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            5.0) //         <--- border radius here
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                  ),
                                  height: 15,
                                  child: Row(
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage(
                                            'images/patientcritical.png'),
                                        width: 7,
                                        height: 10,
                                      ),
                                      Text(
                                        "6 Critical Points",
                                        style: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.users,
                                  size: 10.0,
                                  color: appColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(
                                      color: appColor, fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * .4),
                              child: Text(
                                "Last Visit on 20/1/2019",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.0),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => PatientProfile()),
//                    );
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: SHARE_USERS,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      8.0) //         <--- border radius here
                              ),
                            ),
                            alignment: Alignment.center,
                            width: width / 8,
                            height: height / 15,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/maleIcon.png'),
                                  width: 10,
                                  height: 22,
                                  color: appColor,
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold,
                                      color: appColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: DIAGNOSIS_COLOR,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      8.0) //         <--- border radius here
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
                            width: width / 8,
                            height: height / 15,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image:
                                  AssetImage('images/pregnantIcon.png'),
                                  width: 18,
                                  height: 18,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Pregnant",
                                  style: TextStyle(
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pinkAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: AGE_COLOR,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      8.0) //         <--- border radius here
                              ),
                            ),
                            // color: Colors.white,
                            alignment: Alignment.center,
                            width: width / 8,
                            height: height / 15,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "30",
                                  style: TextStyle(
                                      fontSize: 18.0, color: appColor),
                                ),
                                //SizedBox(height: 2,),
                                Text(
                                  "Years",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      color: appColor),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: INSURANCE,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      8.0) //         <--- border radius here
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
                            width: width / 8,
                            height: height / 15,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image:
                                  AssetImage('images/shieldIcon.png'),
                                  width: 18,
                                  height: 22,
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  "Insured",
                                  style: TextStyle(
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: DIAGNOSIS_COLOR,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      8.0) //         <--- border radius here
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
                            width: width / 8,
                            height: height / 15,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image:
                                  AssetImage('images/diabetesIcon.png'),
                                  width: 18,
                                  height: 18,
                                ),
                                Text(
                                  "Diabetic",
                                  style: TextStyle(
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pinkAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: SHARE_USERS,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      8.0) //         <--- border radius here
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
                            width: width / 8,
                            height: height / 15,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: AssetImage('images/groupIcon.png'),
                                  width: 18,
                                  height: 18,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold,
                                      color: appColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: width / 26,
                top: height / 20,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 22,
              ),
              GestureDetector(
                  onTap: () {
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => PatientProfile()),
//                    );
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 44.0),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(
                              60.0), //         <--- border radius here
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01),
                            child: Image(
                              image: AssetImage('images/patientinfo-emr.png'),
                              width: 39.79,
                              height: 59.03,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .02),
                            child: Text(
                              "Personal",
                              style: TextStyle(
                                  color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Information",
                            style: TextStyle(
                                color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
//    return Navigator.push(
//    context,
//    MaterialPageRoute(
//    builder: (context) => DoctorInformation()),
//    );
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 44.0),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(
                              60.0), //         <--- border radius here
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01),
                            child: Image(
                              image: AssetImage('images/stethoscope.png'),
                              width: 39.79,
                              height: 59.03,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .02),
                            child: Text(
                              "Specialties",
                              style: TextStyle(
                                  color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 22,
              ),
              GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvestigationsScreen()),
                    );
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 44.0),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(
                              60.0), //         <--- border radius here
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01),
                            child: Image(
                              image: AssetImage('images/doctor-emr.png'),
                              width: 39.79,
                              height: 59.03,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .02),
                            child: Text(
                              "Investigations",
                              style: TextStyle(
                                  color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
//    return Navigator.push(
//    context,
//    MaterialPageRoute(
//    builder: (context) => InterventionsScreen()),
//    );
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 44.0),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(
                              60.0), //         <--- border radius here
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01),
                            child: Image(
                              image: AssetImage('images/intervention.png'),
                              width: 39.79,
                              height: 59.03,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .02),
                            child: Text(
                              "Interventions",
                              style: TextStyle(
                                  color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 22,
              ),
              GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReferralsScreen()),
                    );
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 44.0),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(
                              60.0), //         <--- border radius here
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01),
                            child: Image(
                              image: AssetImage('images/referral.png'),
                              width: 39.79,
                              height: 59.03,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .02),
                            child: Text(
                              "Referrals",
                              style: TextStyle(
                                  color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
//    return Navigator.push(
//    context,
//    MaterialPageRoute(
//    builder: (context) => DoctorInformation()),
//    );
                  },
                  child: Container(
                    //padding: EdgeInsets.only(left: 44.0),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
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
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(
                              60.0), //         <--- border radius here
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .01),
                            child: Image(
                              image: AssetImage('images/report.png'),
                              width: 39.79,
                              height: 59.03,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .02),
                            child: Text(
                              "Reports",
                              style: TextStyle(
                                  color: FONT_COLOR, fontSize: 10.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        elevation: 0,
        toolbarHeight: height / 10,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: primaryColor,
              size: width / 20,
            )),
        title: Container(
          width: width / 1.5,
          height: height / 15,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryColor, width: 2.0),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) //                 <--- border radius here
            ),
          ),
          child: Center(
            child: ListTile(
              title: Text("Patients" ,
                style: TextStyle(color: fontColor),
                textAlign: TextAlign.center,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "images/qr-code.png",
                    color: primaryColor,
                    width: width / 30,
                  ),
                  SizedBox(
                    width: width / 50,
                  ),
                  GestureDetector(
                      onTap: () {
                      },
                      child: Icon(
                        Icons.search,
                        color: primaryColor,
                        size: width / 30,
                      ))
                ],
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
              },
              child: Image.asset(
                "images/filter.png",
                color: primaryColor,
                width: width / 30,
              )),
          SizedBox(
            width: width / 50,
          ),
        ],
      ),
      body: body,
    );
  }
}
