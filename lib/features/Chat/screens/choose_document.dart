import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class ChooseDocument extends StatefulWidget {
  @override
  _ChooseDocumentState createState() => _ChooseDocumentState();
}

class _ChooseDocumentState extends State<ChooseDocument> {



  List <DocumentGallery> DocumentsGallery =[];

  List <DocumentGallery> checkedDocumentsGallery =[];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    DocumentsGallery=getDocumentsFromGallery();

  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: accentColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
        child: Stack(

          children: [


            Align(

              alignment: Alignment.topRight,

              child: Text(checkedDocumentsGallery.length.toString()+" Selected",
                style: TextStyle(color: primaryColor,fontSize: 14),),


            ),

            Align(

              alignment: Alignment.topCenter,

              child: Text("Choose Documents",style: TextStyle(color: fontColor,fontSize: 15,fontWeight: FontWeight.bold),),


            ),

            Padding(
              padding: EdgeInsets.only(top: height/20),
              child: Align(


                alignment: Alignment.center,

                child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: DocumentsGallery.map((DocumentGallery DocumentGallery) {
                      return GridTile(
                          child: GestureDetector(
                              onTap: (){

                                setState(() {

                                  DocumentGallery.isChecked?DocumentGallery.isChecked=false:DocumentGallery.isChecked=true;

                                  DocumentGallery.isChecked?
                                  checkedDocumentsGallery.add(DocumentGallery):checkedDocumentsGallery.remove(DocumentGallery);

                                });


                              },
                              child: Stack(
                                children: [

                                  Icon(DocumentGallery.icon, size: width/5),

                                  DocumentGallery.isChecked?Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Icon(Icons.check_circle,color: primaryColor,),
                                  ):Text(""),


                                ],
                              )));
                    }).toList()),
              ),
            ),


            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top:height/50,bottom:height/80),
                child: GestureDetector(
                  onTap: (){

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

                      child: Center(child: Text("Proceed",
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


class DocumentGallery{

  IconData icon;
  bool isChecked = false;


}


List <DocumentGallery> getDocumentsFromGallery(){


  List <DocumentGallery> DocumentsGallery =[];

  DocumentGallery documentGallery = new DocumentGallery();


  for(int i=0;i<20;i++){

    documentGallery = new DocumentGallery();

    documentGallery.icon=Icons.insert_drive_file;

    DocumentsGallery.add(documentGallery);

  }






  return DocumentsGallery;


}