import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';



Widget searchbar(height){

  /*return ListTile(

    leading: Icon(Icons.search,color: searchbarIconColor,),

    title: Text("Search ...",style: TextStyle(fontSize: 15,color: searchbarIconColor),),

    trailing: Icon(Icons.filter_list,color: primaryColor,),

  );*/

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

              trailing: Icon(Icons.filter_list,color: primaryColor,),

            ),
          )
      );

}