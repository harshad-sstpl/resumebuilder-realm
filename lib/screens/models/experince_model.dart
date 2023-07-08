import 'package:realm/realm.dart';
part 'experince_model.g.dart';

@RealmModel()
class $ExperienceModel{
  final String companyName='';
  final String jobTitle='';
  final String startDate='';
  final String endDate='';
  final String details='';
  //const $ExperienceModel({this.companyName='',this.jobTitle='',this.startDate='',this.endDate='',this.details=''});
}
