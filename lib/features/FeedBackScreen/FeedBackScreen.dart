import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/FeedBackScreen/FeedbackSuggest.dart';

import 'FeedbackComplain.dart';
import 'FeedbackRate.dart';





class FeedBackScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FeedBackScreenState();
  }
}

class _FeedBackScreenState extends State<FeedBackScreen> with SingleTickerProviderStateMixin{
  List<Tab> tabList = List();
  TabController _tabController;

  initState() {
    tabList.add(new Tab(text:'Rate Us',));
    tabList.add(new Tab(text:'Suggest',));
    tabList.add(new Tab(text:'Complaint',));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
backgroundColor: backgroundColor,
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
             Center(
               child:  Image(
                 image: AssetImage('images/illustration.png'),
                 width: MediaQuery.of(context).size.width / 1.5,
               ),
             ),
              Container(
                decoration: new BoxDecoration(
                    color: backgroundColor),
                child: new TabBar(
                    controller: _tabController,
                    indicatorColor: appColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: appColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: tabList),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.height ,
                      child: new TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          FeedBackRate(),
                          FeedBackSuggest(),
                          FeedbackComplain(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
