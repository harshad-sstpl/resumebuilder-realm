// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experince_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ExperienceModel extends $ExperienceModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ExperienceModel({
    String companyName = '',
    String jobTitle = '',
    String startDate = '',
    String endDate = '',
    String details = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ExperienceModel>({
        'companyName': '',
        'jobTitle': '',
        'startDate': '',
        'endDate': '',
        'details': '',
      });
    }
    RealmObjectBase.set(this, 'companyName', companyName);
    RealmObjectBase.set(this, 'jobTitle', jobTitle);
    RealmObjectBase.set(this, 'startDate', startDate);
    RealmObjectBase.set(this, 'endDate', endDate);
    RealmObjectBase.set(this, 'details', details);
  }

  ExperienceModel._();

  @override
  String get companyName =>
      RealmObjectBase.get<String>(this, 'companyName') as String;

  @override
  String get jobTitle =>
      RealmObjectBase.get<String>(this, 'jobTitle') as String;

  @override
  String get startDate =>
      RealmObjectBase.get<String>(this, 'startDate') as String;

  @override
  String get endDate => RealmObjectBase.get<String>(this, 'endDate') as String;

  @override
  String get details => RealmObjectBase.get<String>(this, 'details') as String;

  @override
  Stream<RealmObjectChanges<ExperienceModel>> get changes =>
      RealmObjectBase.getChanges<ExperienceModel>(this);

  @override
  ExperienceModel freeze() =>
      RealmObjectBase.freezeObject<ExperienceModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ExperienceModel._);
    return const SchemaObject(
        ObjectType.realmObject, ExperienceModel, 'ExperienceModel', [
      SchemaProperty('companyName', RealmPropertyType.string),
      SchemaProperty('jobTitle', RealmPropertyType.string),
      SchemaProperty('startDate', RealmPropertyType.string),
      SchemaProperty('endDate', RealmPropertyType.string),
      SchemaProperty('details', RealmPropertyType.string),
    ]);
  }
}
