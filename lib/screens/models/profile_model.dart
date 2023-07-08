import 'package:realm/realm.dart';
import 'package:resumebuilder_realm/screens/models/education_model.dart';
import 'package:resumebuilder_realm/screens/models/experince_model.dart';
import 'package:resumebuilder_realm/screens/models/language_model.dart';
import 'package:resumebuilder_realm/screens/models/objective_model.dart';
import 'package:resumebuilder_realm/screens/models/personal_details_model.dart';
import 'package:resumebuilder_realm/screens/models/project_model.dart';
import 'package:resumebuilder_realm/screens/models/skill_model.dart';
part 'profile_model.g.dart';

@RealmModel()
class $ProfileModel{

  $PersonalDetailsModel? personalDetails;
  List<$EducationModel> education=[$EducationModel()];
  List<$ExperienceModel> experience=[$ExperienceModel()];
  List<$SkillModel> skill=[$SkillModel()];
  $ObjectiveModel? objective;
  List<$ProjectModel> project=[$ProjectModel()];
  List<$LanguageModel> language=[$LanguageModel()];
  String? dateTimeCreated;
  
  // $ProfileModel({this.personalDetails= const $PersonalDetailsModel(),this.dateTimeCreated,this.education=const [$EducationModel()],this.experience=const [$ExperienceModel()],this.skill=const [$SkillModel()],this.objective=const $ObjectiveModel(),this.project=const [$ProjectModel()],this.language=const [$LanguageModel()]});

  // $ProfileModel copyWith({
  //   $PersonalDetailsModel? personalDetails,
  //   List<$EducationModel>? education,
  //   List<$ExperienceModel>? experience,
  //   List<$SkillModel>? skill,
  //   $ObjectiveModel? objective,
  //   List<$ProjectModel>? project,
  //   List<$LanguageModel>? language,
  //   String? dateTimeCreated
  // }) =>
  //     $ProfileModel(
  //       personalDetails:personalDetails ?? this.personalDetails,
  //       education: education ?? this.education,
  //       experience: experience ?? this.experience,
  //       skill: skill??this.skill,
  //       objective: objective??this.objective,
  //       project:project??this.project,
  //       language: language??this.language,
  //       dateTimeCreated: dateTimeCreated??this.dateTimeCreated
  //     );

}
