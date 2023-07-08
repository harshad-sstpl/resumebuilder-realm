// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ObjectiveModel extends $ObjectiveModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ObjectiveModel({
    String objective = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ObjectiveModel>({
        'objective': '',
      });
    }
    RealmObjectBase.set(this, 'objective', objective);
  }

  ObjectiveModel._();

  @override
  String get objective =>
      RealmObjectBase.get<String>(this, 'objective') as String;
  @override
  set objective(String value) => RealmObjectBase.set(this, 'objective', value);

  @override
  Stream<RealmObjectChanges<ObjectiveModel>> get changes =>
      RealmObjectBase.getChanges<ObjectiveModel>(this);

  @override
  ObjectiveModel freeze() => RealmObjectBase.freezeObject<ObjectiveModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ObjectiveModel._);
    return const SchemaObject(
        ObjectType.realmObject, ObjectiveModel, 'ObjectiveModel', [
      SchemaProperty('objective', RealmPropertyType.string),
    ]);
  }
}
