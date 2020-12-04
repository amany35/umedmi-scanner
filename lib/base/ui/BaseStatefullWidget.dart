import 'package:umedmiscanner/base/app/CommonImports.dart';

// ignore: must_be_immutable
abstract class BaseStatefulWidget extends StatefulWidget {
  bool isContentAllowedOffline = false;

  BaseStatefulWidget({bool isContentAllowedOffline = false}) {
    this.isContentAllowedOffline = isContentAllowedOffline;
  }
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoadingDialog loadingDialog;

  Widget getAppbar();

  Widget getBody(BuildContext context);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: getBackGround(),
        key: getScreenKey,
        appBar: getAppbar(),
        body: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            initialData: AppConfig.shared.getConnectionStatus(),
            builder: (BuildContext context,
                AsyncSnapshot<ConnectivityResult> snapshot) {
              AppConfig.shared.setConnection(snapshot.data);

              if ((snapshot.data == ConnectivityResult.none) &&
                  !widget.isContentAllowedOffline) {
                return getNotConnectedBody();
              } else {
                return getBody(context);
              }
            }));
  }

  Color getBackGround() {
    return Colors.white;
  }

  get getScreenKey {
    return _scaffoldKey;
  }

  getNotConnectedBody() {
    return Scaffold(
      appBar: AppBarView.getAppBar(
          "Check Your Connection",
          TextStyle(fontFamily: "Roboto", color: Colors.white),
          "",
          TextStyle(color: Colors.white, fontSize: 20),
          null,
          null,
          false),
      body: NoInternetConnection(),
    );
  }

  Future<void> hideDialog() async {
    if (loadingDialog != null && loadingDialog.isShowing()) {
      Navigator.of(context).pop();
      loadingDialog = null;
    }
  }

  void showLoadingDialog() async {
    loadingDialog = LoadingDialog();
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => loadingDialog);
  }

  void showSnack(String msg) async {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }
}
