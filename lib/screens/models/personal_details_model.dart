import 'package:realm/realm.dart';
part 'personal_details_model.g.dart';

@RealmModel()
class $PersonalDetailsModel{
  final String name='';
  final String address='';
  final String email='';
  final String phone='';
  final String dob='';
  final String linkedin='';
  //const $PersonalDetailsModel({this.name='',this.address='',this.email='',this.phone='',this.dob='',this.linkedin=''});
}
