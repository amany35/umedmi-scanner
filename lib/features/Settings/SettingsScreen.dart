import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/Settings/AccountSetting.dart';
import 'package:umedmiscanner/features/subscription/SubscribePageView.dart';

import 'SettingContainerWidget.dart';


class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Center(
                child:  Image(
                  image: AssetImage('images/settings_illustration.png'),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 180,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SettingContainerWidget(title: "Account",pageLink: AccountSetting()),
                    SettingContainerWidget(title: "Chats",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Notification",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Storage & Data Usage",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Invite Friends",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Availablity Times",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Patient Account",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Folder Settings",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Subscription Plan",pageLink: SubscribePageView()),
                    SettingContainerWidget(title: "DashBoard Settings",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Camera Settings",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Share Settings",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "Update App",pageLink: SettingsScreen()),
                    SettingContainerWidget(title: "About",pageLink: SettingsScreen()),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
