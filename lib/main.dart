import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umedmiscanner/features/home/Home.dart';
import 'package:umedmiscanner/features/home/HomeScreen.dart';

import 'base/app/Application.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  var check;
  await SharedPreferences.getInstance().then((res) {
    check = res.getBool('check');
    print("bool"+res.getBool('check').toString());
    const platform = const MethodChannel('flutter.native/helper');
    platform.invokeMethod('helloFromNativeCode');
    runApp(
      Application(check: check),
    );
  });
}


