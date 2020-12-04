import 'package:flutter/cupertino.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/subscription/GoldScreen.dart';
import 'package:umedmiscanner/features/subscription/PlatinumScreen.dart';
import 'package:umedmiscanner/features/subscription/SilverScreen.dart';
import 'package:umedmiscanner/features/subscription/TitaniumScreen.dart';

class SubscribePageView extends StatefulWidget {
  @override
  _SubscribePageViewState createState() => _SubscribePageViewState();
}

class _SubscribePageViewState extends State<SubscribePageView> {

  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: WHITE,
        elevation: 0.0,
        centerTitle: true,
        leading:  GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Image.asset(
            "images/back.png",
            fit: BoxFit.none,
          ),
        ),
        title: Text(
          "Subscription Settings",
          style: TextStyle(
            color: secondaryText,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          Image.asset(
            "images/search.png",
            fit: BoxFit.none,
          ),
        ],
      ) ,
      body: PageView(
        controller: _controller,
        children: [
          PlatinumScreen(),
          TitaniumScreen(),
          GoldScreen(),
          SilverScreen(),
        ],
      ),
    );
  }

}

