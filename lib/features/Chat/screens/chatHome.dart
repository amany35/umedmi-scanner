
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import '../widgets/searchbar.dart';
import 'chats.dart';
import 'messages.dart';



class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}


class _ChatHomeState extends State<ChatHome> with SingleTickerProviderStateMixin, WidgetsBindingObserver{

  TabController _tabController;



  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2,vsync: this);
    _tabController.addListener(_handleTabSelection);
    WidgetsBinding.instance.addObserver(this);

  }

  void _handleTabSelection() {
    setState(() {
    });
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }


  Widget _chatsTab(width) {
    return Container(
      height: 25 + MediaQuery
          .of(context)
          .padding
          .bottom,
      padding: EdgeInsets.all(0),
      width: width,
      decoration:  BoxDecoration(border:
      Border(right: BorderSide(color: chatsMessagesDividerColor, width: 3, style: BorderStyle.solid))),
      child: Tab(
        child:Container(
          width: width/1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/chat_bubble.png",
                width: width/15,
                  color: _tabController.index == 0
                      ? primaryColor
                      : unActiveTabbarColor
              ),

              SizedBox(width: width/20,),
              Container(
                  child: Text("Chats", textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
            ],
          ),
        ),),
    );
  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: accentColor,
        title: searchbar(height),
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/30),
            child: TabBar(
              controller: _tabController,

              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4.0,color:primaryColor ),
                  insets: EdgeInsets.symmetric(horizontal:width/4.5),
                  //  insets: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width* 0.1)
              ),
              unselectedLabelColor: unActiveTabbarColor,
              labelColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.all(0),
              indicatorPadding: EdgeInsets.all(0),
              tabs: <Widget>[
                _chatsTab(width),

                Tab(
                  child:Container(
                    width: width/1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Image.asset(
                          "images/inbox.png",
                          width: width/15,
                            color: _tabController.index == 1
                                ? primaryColor
                                : unActiveTabbarColor
                        ),

                        SizedBox(width: width/20,),
                        Container(
                            child: Text("Messages", textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Chats(),
          Messages(),
        ],
      ),

    );
  }
}
