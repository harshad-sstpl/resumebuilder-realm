// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ProjectModel extends $ProjectModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ProjectModel({
    String title = '',
    String detasils = '',
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ProjectModel>({
        'title': '',
        'detasils': '',
      });
    }
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'detasils', detasils);
  }

  ProjectModel._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get detasils =>
      RealmObjectBase.get<String>(this, 'detasils') as String;
  @override
  set detasils(String value) => RealmObjectBase.set(this, 'detasils', value);

  @override
  Stream<RealmObjectChanges<ProjectModel>> get changes =>
      RealmObjectBase.getChanges<ProjectModel>(this);

  @override
  ProjectModel freeze() => RealmObjectBase.freezeObject<ProjectModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProjectModel._);
    return const SchemaObject(
        ObjectType.realmObject, ProjectModel, 'ProjectModel', [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('detasils', RealmPropertyType.string),
    ]);
  }
}
