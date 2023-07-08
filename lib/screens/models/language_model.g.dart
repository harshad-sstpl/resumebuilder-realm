// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class LanguageModel extends $LanguageModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  LanguageModel({
    String language = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<LanguageModel>({
        'language': '',
      });
    }
    RealmObjectBase.set(this, 'language', language);
  }

  LanguageModel._();

  @override
  String get language =>
      RealmObjectBase.get<String>(this, 'language') as String;
  @override
  set language(String value) => RealmObjectBase.set(this, 'language', value);

  @override
  Stream<RealmObjectChanges<LanguageModel>> get changes =>
      RealmObjectBase.getChanges<LanguageModel>(this);

  @override
  LanguageModel freeze() => RealmObjectBase.freezeObject<LanguageModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LanguageModel._);
    return const SchemaObject(
        ObjectType.realmObject, LanguageModel, 'LanguageModel', [
      SchemaProperty('language', RealmPropertyType.string),
    ]);
  }
}
