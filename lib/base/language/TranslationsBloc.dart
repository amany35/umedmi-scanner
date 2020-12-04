import 'package:umedmiscanner/base/app/CommonImports.dart';

class TranslationsBloc implements BlocBase {
  StreamController<String> _languageController = StreamController<String>();
  Stream<String> get currentLanguage => _languageController.stream;

  StreamController<Locale> _localeController = StreamController<Locale>();
  Stream<Locale> get currentLocale => _localeController.stream;

  @override
  void dispose() {
    _languageController?.close();
    _localeController?.close();
  }

  void setNewLanguage(String newLanguage) async {
//    await preferences.setPreferredLanguage(newLanguage);
    await allTranslations.setNewLanguage(newLanguage: newLanguage).then((v) {
      _languageController.sink.add(newLanguage);
      _localeController.sink.add(allTranslations.locale);
    });
  }
}
