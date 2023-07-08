// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class PersonalDetailsModel extends $PersonalDetailsModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  PersonalDetailsModel({
    String name = '',
    String address = '',
    String email = '',
    String phone = '',
    String dob = '',
    String linkedin = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<PersonalDetailsModel>({
        'name': '',
        'address': '',
        'email': '',
        'phone': '',
        'dob': '',
        'linkedin': '',
      });
    }
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set(this, 'dob', dob);
    RealmObjectBase.set(this, 'linkedin', linkedin);
  }

  PersonalDetailsModel._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;

  @override
  String get address => RealmObjectBase.get<String>(this, 'address') as String;

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;

  @override
  String get phone => RealmObjectBase.get<String>(this, 'phone') as String;

  @override
  String get dob => RealmObjectBase.get<String>(this, 'dob') as String;

  @override
  String get linkedin =>
      RealmObjectBase.get<String>(this, 'linkedin') as String;

  @override
  Stream<RealmObjectChanges<PersonalDetailsModel>> get changes =>
      RealmObjectBase.getChanges<PersonalDetailsModel>(this);

  @override
  PersonalDetailsModel freeze() =>
      RealmObjectBase.freezeObject<PersonalDetailsModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PersonalDetailsModel._);
    return const SchemaObject(
        ObjectType.realmObject, PersonalDetailsModel, 'PersonalDetailsModel', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('address', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('phone', RealmPropertyType.string),
      SchemaProperty('dob', RealmPropertyType.string),
      SchemaProperty('linkedin', RealmPropertyType.string),
    ]);
  }
}
