import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resumebuilder_realm/main.dart';
import 'package:resumebuilder_realm/screens/models/objective_model.dart';
import 'package:resumebuilder_realm/screens/models/personal_details_model.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/widgets/common_textfield.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final int? id;
  final ProfileModel? profile;
  const PersonalDetailsScreen({super.key,this.id,this.profile});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final nameController=TextEditingController();
  final addressController=TextEditingController();
  final emailController=TextEditingController();
  final phoneController=TextEditingController();
  final dobController=TextEditingController();
  final linkedinController=TextEditingController();

  @override
  void initState() {
    if(widget.profile!=null){
    nameController.text=widget.profile!.personalDetails!.name;
    addressController.text=widget.profile!.personalDetails!.address;
    emailController.text=widget.profile!.personalDetails!.email;
    phoneController.text=widget.profile!.personalDetails!.phone;
    dobController.text=widget.profile!.personalDetails!.dob;
    linkedinController.text=widget.profile!.personalDetails!.linkedin;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "Personal Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
              onTap: () {
                if(widget.id==null){
                  final profile=ProfileModel(dateTimeCreated:"${DateFormat.yMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",personalDetails: PersonalDetailsModel(name:nameController.text,address:addressController.text,email:emailController.text,phone:phoneController.text,dob: dobController.text,linkedin:linkedinController.text),
                  objective:ObjectiveModel()
                  );
                  realm.write(() {realm.add(profile);});
                  //Hive.box<ProfileModel>('profileBox').add(profile);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                else{
                  //final profile=widget.profile!.copyWith(personalDetails: PersonalDetailsModel(name:nameController.text,address:addressController.text,email:emailController.text,phone:phoneController.text,dob: dobController.text,linkedin:linkedinController.text));
                 // Hive.box<ProfileModel>('profileBox').putAt(widget.id!,profile);
                 ProfileModel newProfile = ProfileModel(
                    personalDetails: PersonalDetailsModel(name:nameController.text,address:addressController.text,email:emailController.text,phone:phoneController.text,dob:dobController.text,linkedin:linkedinController.text),
                    objective: widget.profile!.objective,
                    dateTimeCreated: widget.profile!.dateTimeCreated,
                    education:widget.profile!.education,
                    experience:widget.profile!.experience,
                    skill:widget.profile!.skill,
                    project: widget.profile!.project,
                    language:widget.profile!.language
                  );
                  realm.write(() {realm.delete<ProfileModel>(widget.profile!);});
                  realm.write(() => realm.add(newProfile));
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.done_outline,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonTextField(
                controller: nameController,
                labelText: "Name",
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: addressController,
                labelText: "Address",
                maxLines: 2,
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: emailController,
                labelText: "Email",
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: phoneController,
                labelText: "Phone",
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: dobController,
                labelText: "Date of Birth",
              ),
              SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller:linkedinController,
                labelText: "LinkedIn",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
