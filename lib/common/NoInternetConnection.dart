import 'package:flutter/material.dart';

class NoInternetConnection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NoInternetConnectionState();
  }
}

class NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
   return Center(
       child: Container(
         width: MediaQuery.of(context).size.width * 0.8,
         height: MediaQuery.of(context).size.height * 0.3,
         padding: EdgeInsets.all(10.0),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Icon(Icons.signal_cellular_connected_no_internet_4_bar
               ,size: 100,
               color: Colors.yellow,
             )
             ,
             Container(
               height: 15.0,
             ),
             Text("No Internet Connection",
                 style: TextStyle(
                     color: Colors.red,
                     fontSize: 18,
                     fontWeight: FontWeight.w500)),
             Container(
               height: 20.0,
             ),
             Expanded(
               child: Text("Screen will reloaded automatically once connection retained",
                   overflow: TextOverflow.clip,
                   textAlign: TextAlign.center,
                   maxLines: 3,
                   style: TextStyle(
                       color: Colors.grey,
                       fontSize: 14,
                       fontWeight: FontWeight.w500)),
             )
           ],
         ),
       ));
  }
}
