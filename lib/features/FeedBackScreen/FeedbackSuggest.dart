import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permissions_plugin/permissions_plugin.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SuggestionReceived.dart';



const languages = const [
  const Language('English', 'en_US'),
  const Language('Francais', 'fr_FR'),
  const Language('Pусский', 'ru_RU'),
  const Language('Italiano', 'it_IT'),
  const Language('Español', 'es_ES'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class FeedBackSuggest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FeedBackSuggestState();
  }
}

class _FeedBackSuggestState extends State<FeedBackSuggest> {
  TextEditingController _controller = new TextEditingController();
  SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;


  bool startRecord = false;
  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    _checkAudioPermission();
    activateSpeechRecognizer();

  }

  void _checkAudioPermission() async {

    Map<Permission, PermissionState> permission = await PermissionsPlugin
        .checkPermissions([
    Permission.RECORD_AUDIO,
    ]);
    if (permission[Permission.RECORD_AUDIO] != PermissionState.GRANTED) {
     permission = await PermissionsPlugin
        .requestPermissions([
    Permission.RECORD_AUDIO,
    ]);
    }
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
//    _speech.setRecognitionCompleteHandler((_) => onRecognitionComplete);
//    _speech.setErrorHandler(onErrorHandler);
    _speech
        .activate()
        .then((res) => setState(() => _speechRecognitionAvailable = res));
  }


  @override
  Widget build(BuildContext context) {
    final submitButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.height * .3,
      height: MediaQuery.of(context).size.height * .06,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SuggestionReceived()),
          );
        },
        color: appColor,
        child: Text("Submit", style: TextStyle(color: Colors.white)),
      ),
    );
    final body = Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 25,),
          Text("If you have any suggession to help us improve our service, You're more than welcome to submit them below :)",
            style: TextStyle(color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                  25.7) //         <--- border radius here
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    !startRecord ? IconButton(
                      onPressed: () {
                        setState(() {
                          startRecord = true;
                        });
                      },
                      icon: Icon(FontAwesomeIcons.microphone, size: 20,),
                      color: Colors.pinkAccent,)
                        :Row(
                      children: <Widget>[
                        _buildButton(
                          onPressed: _speechRecognitionAvailable && !_isListening
                              ? () => start()
                              : null,
                          icon: _isListening
                              ? Icon(FontAwesomeIcons.volumeUp, size: 18,)
                              : Icon(FontAwesomeIcons.microphone, size: 18,),
                        ),
                        _buildButton(
                          onPressed: _isListening ? () => cancel() : null,
                          icon: Icon(Icons.cancel, color: appColor, size: 18,),
                        ),
                        _buildButton(
                          onPressed: _isListening ? () => stop() : null,
                          icon: Icon(FontAwesomeIcons.stopCircle, size: 18,),
                        ),
                      ],
                    ),
                    (Platform.isAndroid) ? IconButton(
                      onPressed: () async {
                        await launch("https://play.google.com/store/apps/details?id=com.google.android.apps.handwriting.ime&hl=en_US");
                      },
                      icon: Icon(FontAwesomeIcons.pencilAlt, color: Colors.pinkAccent, size: 18,),
                      )
                        : IconButton(
                        onPressed: () async {
                          await launch("https://apps.apple.com/us/app/handwriting-keyboard/id926102392");
                        },
                      icon: Icon(FontAwesomeIcons.pencilAlt, color: Colors.pinkAccent, size: 18,),
                      ),
                  ],
                ),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'type your thoughts here...',
                    filled: true,
                    fillColor: Colors.white70,
                    contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),),
              ],
            )
          ),
          SizedBox(height: 25,),
          submitButton,
        ],
      ),
      ),
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: body,
      ),
    );
  }
  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => new CheckedPopupMenuItem<Language>(
    value: l,
    checked: selectedLang == l,
    child: new Text(l.name),
  ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({Icon icon, VoidCallback onPressed}) => new Padding(
      padding: new EdgeInsets.all(5.0),
      child: new IconButton(
        color: appColor,
        onPressed: onPressed,
        icon: icon,
      ));

  void start() => _speech
      .listen(locale: selectedLang.code)
      .then((result) => print('_MyAppState.start => result ${result}'));

  void cancel() =>
      _speech.cancel().then((result) => setState(() => _isListening = false));

  void stop() =>
      _speech.stop().then((result) => setState(() => _isListening = false));

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(
            () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState((){
    String updatedText = _controller.text + "" + text;
    _controller.text = updatedText;

  });

  void onRecognitionComplete() => setState(() => _isListening = false);

  void onErrorHandler() => activateSpeechRecognizer();
}
