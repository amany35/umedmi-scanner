import 'dart:io';

import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class AppBarView {
  static AppBar getHomeAppBar(Widget title, List<Widget> actions) {
    return new AppBar(
      title: title,
      backgroundColor: Colors.lightGreen,
      actions: actions,
    );
  }

  static AppBar buildAppBar(Widget title, Widget actions, bool center) {
    return AppBar(
      centerTitle: center,
      backgroundColor: Colors.lightGreen,
      title: title,
      actions: <Widget>[actions],
    );
  }

  static AppBar getGeneralAppBar(
      String title,
      ActionClickListener actionClickListener,
      NavigationListener navigationListener,
      TextStyle actionStyle,
      bool back) {
    return AppBar(
      backgroundColor: Colors.cyan,
      elevation: 0,
      leading: back
          ? SafeArea(
              child: InkWell(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 15, 15, 15),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  onTap: () {
                    if (back) navigationListener.back();
                  }))
          : Text(''),
      title: Text(
        title,
        style: actionStyle,
      ),
      centerTitle: false,
    );
  }

  static AppBar getActionsAppBar(
      String title,
      TextStyle titleStyle,
      String actionText,
      TextStyle actionStyle,
      ActionClickListener actionClickListener,
      NavigationListener navigationListener,
      bool back,
      {List<Widget> actions}) {
    return AppBar(
      backgroundColor: PRIMARY_COLOR,
      leading: back
          ? SafeArea(
              child: GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 18, 18, 18),
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        color: Colors.white,
                      )),
                  onTap: () {
                    if (back) navigationListener.back();
                  }))
          : Text(''),
      title: Text(
        title,
        style: titleStyle,
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  static AppBar getAppBar(
      String title,
      TextStyle titleStyle,
      String actionText,
      TextStyle actionStyle,
      ActionClickListener actionClickListener,
      NavigationListener navigationListener,
      bool back,
      {bool submitting}) {
    return AppBar(
      backgroundColor: PRIMARY_COLOR,
      leading: back
          ? SafeArea(
              child: GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 18, 18, 18),
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        color: Colors.white,
                      )),
                  onTap: () {
                    if (back) navigationListener.back();
                  }))
          : Text(''),
      title: Text(
        title,
        style: titleStyle,
      ),
      centerTitle: false,
      actions: <Widget>[
        SafeArea(
            child: (submitting ?? false)
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)))
                : GestureDetector(
                    onTap: () {
                      if (actionText != null && actionClickListener != null)
                        actionClickListener.onActionClick(1);
                    },
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              actionText == null ? '' : actionText,
                              style: actionStyle,
                            )))))
      ],
    );
  }
}

abstract class ActionClickListener {
  onActionClick(int actionId);
}

abstract class NavigationListener {
  void back();
}

const MENU_ACTION_ID = 122;

const COURSE_FILTER_ID = 122;
