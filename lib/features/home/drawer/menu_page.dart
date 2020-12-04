import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/Chat/screens/chatHome.dart';
import 'package:umedmiscanner/features/Profile/DoctorProfileScreen.dart';
import 'package:umedmiscanner/features/home/drawer/zoom_scaffold.dart';
import 'package:umedmiscanner/resources/Images.dart';

import 'circular_image.dart';

class MenuScreen extends StatefulWidget {
  final Function onSelectedDrawerItem;

  MenuScreen(this.onSelectedDrawerItem,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";
bool isSocialDistanceSwitched = false;
  final List<MenuItem> options = [
    MenuItem(HOME_ICON, 'Home'),
    MenuItem(SCAN_ICON, 'Scan Document'),
    MenuItem(Folders_ICON, 'My Folders'),
    MenuItem(PATIENT_ICON, 'Patients'),
//    MenuItem(SHARED_ICON, 'Shared Patients'),
    MenuItem(COVID_ICON, 'Health Tips(COVID-19)'),
    MenuItem(SCAN_ICON, 'Social Distancing'),
    MenuItem(SAVED_ICON, 'Bookmarks'),
    MenuItem(SETTINGS_ICON, 'Settings'),
    MenuItem(FEEDBACK_ICON, 'Feedback'),
    MenuItem(HELP_ICON, 'Help'),
    MenuItem(LOGOUT_ICON, 'Logout'),

  ];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    child: CircularImage(
                      NetworkImage(imageUrl),
                    ),
                    onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorProfileScreen()),
                    );
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tatiana',
                      style: TextStyle(
                        color: Color(0xff1D282E),
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Basic Membership',
                        style: TextStyle(
                          color: Color(0xff1D282E),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child:GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatHome()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image:  AssetImage('images/mailbox.png')),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0,
                              color: Colors.white,
                            )
                          ]),
                    ),
                  ),
//                  child: CircularImage(
//                    AssetImage('images/mailbox.png'),
//                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options.map((item) {
                  return InkWell(
                      onTap: (){
                        Provider.of<MenuController>(context, listen: true).toggle();

                        widget.onSelectedDrawerItem(item);
                      },
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: (item.title != "Social Distancing") ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
//                              child: AssetImage(
//                                item.icon,
//                                color: Colors.white,
//                                size: 20,
//                              ),
                                child:  Image(
                                  image: AssetImage( item.icon),
                                  width: 20,
                                  height: 20,
                                )
                            ),
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffBEBCC9)),
                            )
                          ],
                        ): Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child:  Image(
                                  image: AssetImage( item.icon),
                                  width: 20,
                                  height: 20,
                                )
                            ),
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffBEBCC9)),
                            ),
                            Transform.scale(
                              scale: 0.6,
                              child: Switch(
                              value: isSocialDistanceSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSocialDistanceSwitched = value;
                                });
                              },
                              activeTrackColor: backgroundColor,
                              activeColor: appColor,
                            ),
                            ),
                          ],
                        ),
                      )
                    /*ListTile(
                      leading: Icon(
                        item.icon,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),*/
                  );
                }).toList(),
              ),
            ),
            /*  Spacer(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.headset_mic,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Support',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),*/
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  String icon;

  MenuItem(this.icon, this.title);
}