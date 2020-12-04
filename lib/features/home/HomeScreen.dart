
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/Chat/screens/chatHome.dart';
import 'package:umedmiscanner/features/CovidDashBoard/screens/CovidPageView.dart';
import 'package:umedmiscanner/features/FeedBackScreen/FeedBackScreen.dart';
import 'package:umedmiscanner/features/FoldersScreen/FoldersScreen.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientScreen.dart';
import 'package:umedmiscanner/features/Settings/SettingsScreen.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart';
import 'package:umedmiscanner/features/registration/login/LoginScreen.dart';
import 'package:umedmiscanner/features/shared/SharedScreen.dart';

import 'Home.dart';
import 'drawer/menu_page.dart';
import 'drawer/zoom_scaffold.dart';

class HomeScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends BaseState<HomeScreen>
    with TickerProviderStateMixin
    implements ActionClickListener, NavigationListener {
  MenuController menuController;
  Widget slectedWidget = Home();
  String selectedScreenTitle = "Home";

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();

    super.dispose();
  }

  @override
  onActionClick(int actionId) {}

  @override
  void back() {
    Navigator.pop(context);
  }

  @override
  Widget getAppbar() {
    return null;
  }


  @override
  Widget getBody(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen((MenuItem item) {
          if (item.title == "Home") {
            setState(() {
              slectedWidget = Home();
              selectedScreenTitle=item.title;
            });
          }
          else if(item.title=="My Patients"){
            setState(() {
              // slectedWidget = PatientScreen();
              // selectedScreenTitle=item.title;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientScreen()),
              );

            });
          }
          else if(item.title=="My Folders"){
            setState(() {
              slectedWidget = FoldersScreen();
              selectedScreenTitle=item.title;

            });
          }

          else if(item.title=="Scan Document"){
            setState(() {


              // selectedWidget=SingleScan();
              // selectedScreenTitle=item.title;

              images.clear();

              id_images.clear();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingleScan()),
              );


            });
          }
          else if(item.title=="Shared Patients"){
            setState(() {
              slectedWidget = SharedScreen();
              selectedScreenTitle=item.title;

            });
          }
          else if(item.title=="Health Tips(COVID-19)"){
            setState(() {
              slectedWidget = CovidPageView();
              selectedScreenTitle=item.title;

            });
          }
          else if(item.title=="Saved"){
            setState(() {
              slectedWidget = ChatHome();
              selectedScreenTitle=item.title;

            });
          }
          else if(item.title=="Settings"){
            setState(() {
              slectedWidget = SettingsScreen();
              selectedScreenTitle=item.title;

            });
          }

          else if(item.title=="Feedback"){
            setState(() {
              slectedWidget = FeedBackScreen();
              selectedScreenTitle=item.title;

            });
          }
          else if(item.title=="Logout"){
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text('Do you want to exit this application?'),
                content: Text('We hate to see you leave...'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      print("you choose no");
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                    onPressed: () async {
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setBool("check", false);
//                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                    },
                    child: Text('Yes'),
                  ),
                ],
              ),
            ) ??
                false;
          }
        }),
        contentScreen: Layout(
          contentBuilder: (cc) =>
              Container(
                color: backgroundColor,
                child: slectedWidget,
              ),

        ),
        screenTitle: Text(selectedScreenTitle, style: TextStyle(color: BLACK),),
        actions: <Widget>[
          Icon(Icons.search,color: onBoardingColor,),
          SizedBox(width: 10,),
          Icon(Icons.sort,color: onBoardingColor,),
          SizedBox(width: 10,),
          Icon(Icons.dashboard,color: onBoardingColor,),
          SizedBox(width: 10,),

        ],
      ),
    );
  }

}