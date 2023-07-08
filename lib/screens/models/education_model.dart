import 'package:realm/realm.dart';
part 'education_model.g.dart';

@RealmModel()
class $EducationModel{
   String course='';
   String school='';
   String score='';
   String year='';
  //const $EducationModel({this.course='',this.school='',this.score='',this.year=''});
}
