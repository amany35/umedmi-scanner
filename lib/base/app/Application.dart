import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/base/language/TranslationsBloc.dart';
import 'package:umedmiscanner/features/AddPatient/AddPatientScreen.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_diagnosis.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_diagnosis_search.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_home.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_interventions.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_main.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_patient_information.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_prescriptions.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_prescriptions_preview.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_vital_signs_graph.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_vitalsigns_table_newentry_one.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_vitalsignstable_newentry.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_specialties.dart';
import 'package:umedmiscanner/features/EMR/widget/container_widget_prescription.dart';
import 'package:umedmiscanner/features/home/HomeScreen.dart';
import 'package:umedmiscanner/features/splashScreens/splash/SplashScreen.dart';

class Application extends StatefulWidget {
  final bool check;

  const Application({Key key, this.check}) : super(key: key);
  @override
  ApplicationState createState() {
    allTranslations.init();
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {
  TranslationsBloc translationsBloc;

//  @override
//  void initState() {
//    super.initState();
//    translationsBloc = TranslationsBloc();
////    preferences.getPreferredLanguage().then((String lang) {
////      translationsBloc.setNewLanguage(lang);
//    });
//  }

  @override
  void dispose() {
//    translationsBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider<TranslationsBloc>(
        bloc: translationsBloc,
        child: StreamBuilder<Locale>(
//          stream: translationsBloc.currentLocale,
//          initialData: allTranslations.locale,
            builder: (BuildContext context, AsyncSnapshot<Locale> snapshot) {
              return MaterialApp(
                title: 'Umedmi Scan',
                debugShowCheckedModeBanner: false,
                locale: snapshot.data ?? allTranslations.locale,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: allTranslations.supportedLocales(),
                home: EmrInterventions(),
               // home:widget.check == true? HomeScreen(): SplashScreen(),
        //      home:AddPatientScreen(),
              );
            }),
      );
  }
}


