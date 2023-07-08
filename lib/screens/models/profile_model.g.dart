// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ProfileModel extends $ProfileModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ProfileModel({
    PersonalDetailsModel? personalDetails,
    ObjectiveModel? objective,
    String? dateTimeCreated,
    Iterable<EducationModel> education = const [],
    Iterable<ExperienceModel> experience = const [],
    Iterable<SkillModel> skill = const [],
    Iterable<ProjectModel> project = const [],
    Iterable<LanguageModel> language = const [],
  }) {
    RealmObjectBase.set(this, 'personalDetails', personalDetails);
    RealmObjectBase.set(this, 'objective', objective);
    RealmObjectBase.set(this, 'dateTimeCreated', dateTimeCreated);
    RealmObjectBase.set<RealmList<EducationModel>>(
        this, 'education', RealmList<EducationModel>(education));
    RealmObjectBase.set<RealmList<ExperienceModel>>(
        this, 'experience', RealmList<ExperienceModel>(experience));
    RealmObjectBase.set<RealmList<SkillModel>>(
        this, 'skill', RealmList<SkillModel>(skill));
    RealmObjectBase.set<RealmList<ProjectModel>>(
        this, 'project', RealmList<ProjectModel>(project));
    RealmObjectBase.set<RealmList<LanguageModel>>(
        this, 'language', RealmList<LanguageModel>(language));
  }

  ProfileModel._();

  @override
  PersonalDetailsModel? get personalDetails =>
      RealmObjectBase.get<PersonalDetailsModel>(this, 'personalDetails')
          as PersonalDetailsModel?;
  @override
  set personalDetails(covariant PersonalDetailsModel? value) =>
      RealmObjectBase.set(this, 'personalDetails', value);

  @override
  RealmList<EducationModel> get education =>
      RealmObjectBase.get<EducationModel>(this, 'education')
          as RealmList<EducationModel>;
  @override
  set education(covariant RealmList<EducationModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<ExperienceModel> get experience =>
      RealmObjectBase.get<ExperienceModel>(this, 'experience')
          as RealmList<ExperienceModel>;
  @override
  set experience(covariant RealmList<ExperienceModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<SkillModel> get skill =>
      RealmObjectBase.get<SkillModel>(this, 'skill') as RealmList<SkillModel>;
  @override
  set skill(covariant RealmList<SkillModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  ObjectiveModel? get objective =>
      RealmObjectBase.get<ObjectiveModel>(this, 'objective') as ObjectiveModel?;
  @override
  set objective(covariant ObjectiveModel? value) =>
      RealmObjectBase.set(this, 'objective', value);

  @override
  RealmList<ProjectModel> get project =>
      RealmObjectBase.get<ProjectModel>(this, 'project')
          as RealmList<ProjectModel>;
  @override
  set project(covariant RealmList<ProjectModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<LanguageModel> get language =>
      RealmObjectBase.get<LanguageModel>(this, 'language')
          as RealmList<LanguageModel>;
  @override
  set language(covariant RealmList<LanguageModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get dateTimeCreated =>
      RealmObjectBase.get<String>(this, 'dateTimeCreated') as String?;
  @override
  set dateTimeCreated(String? value) =>
      RealmObjectBase.set(this, 'dateTimeCreated', value);

  @override
  Stream<RealmObjectChanges<ProfileModel>> get changes =>
      RealmObjectBase.getChanges<ProfileModel>(this);

  @override
  ProfileModel freeze() => RealmObjectBase.freezeObject<ProfileModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProfileModel._);
    return const SchemaObject(
        ObjectType.realmObject, ProfileModel, 'ProfileModel', [
      SchemaProperty('personalDetails', RealmPropertyType.object,
          optional: true, linkTarget: 'PersonalDetailsModel'),
      SchemaProperty('education', RealmPropertyType.object,
          linkTarget: 'EducationModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('experience', RealmPropertyType.object,
          linkTarget: 'ExperienceModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('skill', RealmPropertyType.object,
          linkTarget: 'SkillModel', collectionType: RealmCollectionType.list),
      SchemaProperty('objective', RealmPropertyType.object,
          optional: true, linkTarget: 'ObjectiveModel'),
      SchemaProperty('project', RealmPropertyType.object,
          linkTarget: 'ProjectModel', collectionType: RealmCollectionType.list),
      SchemaProperty('language', RealmPropertyType.object,
          linkTarget: 'LanguageModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('dateTimeCreated', RealmPropertyType.string,
          optional: true),
    ]);
  }
}
