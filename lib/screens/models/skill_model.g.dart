// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class SkillModel extends $SkillModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SkillModel({
    String skill = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SkillModel>({
        'skill': '',
      });
    }
    RealmObjectBase.set(this, 'skill', skill);
  }

  SkillModel._();

  @override
  String get skill => RealmObjectBase.get<String>(this, 'skill') as String;
  @override
  set skill(String value) => RealmObjectBase.set(this, 'skill', value);

  @override
  Stream<RealmObjectChanges<SkillModel>> get changes =>
      RealmObjectBase.getChanges<SkillModel>(this);

  @override
  SkillModel freeze() => RealmObjectBase.freezeObject<SkillModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SkillModel._);
    return const SchemaObject(
        ObjectType.realmObject, SkillModel, 'SkillModel', [
      SchemaProperty('skill', RealmPropertyType.string),
    ]);
  }
}
