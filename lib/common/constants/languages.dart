import 'package:finq/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'my', value: 'Myanmar'),
  ];

  static String getLanguageName(String code) =>
      languages.where((element) => code == element.code).first.value;
}
