// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class EducationModel extends $EducationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  EducationModel({
    String course = '',
    String school = '',
    String score = '',
    String year = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<EducationModel>({
        'course': '',
        'school': '',
        'score': '',
        'year': '',
      });
    }
    RealmObjectBase.set(this, 'course', course);
    RealmObjectBase.set(this, 'school', school);
    RealmObjectBase.set(this, 'score', score);
    RealmObjectBase.set(this, 'year', year);
  }

  EducationModel._();

  @override
  String get course => RealmObjectBase.get<String>(this, 'course') as String;
  @override
  set course(String value) => RealmObjectBase.set(this, 'course', value);

  @override
  String get school => RealmObjectBase.get<String>(this, 'school') as String;
  @override
  set school(String value) => RealmObjectBase.set(this, 'school', value);

  @override
  String get score => RealmObjectBase.get<String>(this, 'score') as String;
  @override
  set score(String value) => RealmObjectBase.set(this, 'score', value);

  @override
  String get year => RealmObjectBase.get<String>(this, 'year') as String;
  @override
  set year(String value) => RealmObjectBase.set(this, 'year', value);

  @override
  Stream<RealmObjectChanges<EducationModel>> get changes =>
      RealmObjectBase.getChanges<EducationModel>(this);

  @override
  EducationModel freeze() => RealmObjectBase.freezeObject<EducationModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EducationModel._);
    return const SchemaObject(
        ObjectType.realmObject, EducationModel, 'EducationModel', [
      SchemaProperty('course', RealmPropertyType.string),
      SchemaProperty('school', RealmPropertyType.string),
      SchemaProperty('score', RealmPropertyType.string),
      SchemaProperty('year', RealmPropertyType.string),
    ]);
  }
}
