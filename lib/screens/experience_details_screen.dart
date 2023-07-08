import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resumebuilder_realm/main.dart';
import 'package:resumebuilder_realm/screens/models/experince_model.dart';
import 'package:resumebuilder_realm/screens/models/objective_model.dart';
import 'package:resumebuilder_realm/screens/models/personal_details_model.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/widgets/common_textfield.dart';

class ExperienceDetailsScreen extends StatefulWidget {
  final ProfileModel? profile;
  final int? id;
  const ExperienceDetailsScreen({super.key, this.id, this.profile});

  @override
  State<ExperienceDetailsScreen> createState() =>
      _ExperienceDetailsScreenState();
}

class _ExperienceDetailsScreenState extends State<ExperienceDetailsScreen> {
  int numOfExperince = 1;
  List textControllers = [
    {
      "companyName": TextEditingController(),
      "jobTitle": TextEditingController(),
      "startDate": TextEditingController(),
      "endDate": TextEditingController(),
      "details": TextEditingController()
    }
  ];

  @override
  void initState() {
    if (widget.profile != null) {
      for (int i = 1; i < widget.profile!.experience.length; i++) {
        textControllers.add({
          "companyName": TextEditingController(),
          "jobTitle": TextEditingController(),
          "startDate": TextEditingController(),
          "endDate": TextEditingController(),
          "details": TextEditingController()
        });
      }

      for (int i = 0; i < widget.profile!.experience.length; i++) {
        textControllers[i]["companyName"].text =
            widget.profile!.experience[i].companyName;
        textControllers[i]["jobTitle"].text =
            widget.profile!.experience[i].jobTitle;
        textControllers[i]["startDate"].text =
            widget.profile!.experience[i].startDate;
        textControllers[i]["endDate"].text =
            widget.profile!.experience[i].endDate;
        textControllers[i]["details"].text =
            widget.profile!.experience[i].details;
      }
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
          "Experience",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
              onTap: () {
                if (widget.id == null) {
                  List<ExperienceModel> exps = [];
                  for (int i = 0; i < textControllers.length; i++) {
                    exps.add(ExperienceModel(
                        companyName: textControllers[i]["companyName"].text,
                        jobTitle: textControllers[i]["jobTitle"].text,
                        startDate: textControllers[i]["startDate"].text,
                        endDate: textControllers[i]["endDate"].text,
                        details: textControllers[i]["details"].text));
                  }
                  final profile = ProfileModel(
                    personalDetails:PersonalDetailsModel(),
                    objective:ObjectiveModel(),
                      dateTimeCreated:
                          "${DateFormat.yMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",
                      experience: exps);
                      realm.write(() {realm.add(profile);});
                  //Hive.box<ProfileModel>('profileBox').add(profile);
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  List<ExperienceModel> exps = [];
                  for (int i = 0; i < textControllers.length; i++) {
                    exps.add(ExperienceModel(
                        companyName: textControllers[i]["companyName"].text,
                        jobTitle: textControllers[i]["jobTitle"].text,
                        startDate: textControllers[i]["startDate"].text,
                        endDate: textControllers[i]["endDate"].text,
                        details: textControllers[i]["details"].text));
                  }
                  ProfileModel newProfile = ProfileModel(
                    personalDetails: widget.profile!.personalDetails,
                    objective: widget.profile!.objective,
                    dateTimeCreated: widget.profile!.dateTimeCreated,
                    education:widget.profile!.education,
                    experience: exps,
                    skill:widget.profile!.skill,
                    project: widget.profile!.project,
                    language:widget.profile!.language
                  );
                  realm.write(() {realm.delete<ProfileModel>(widget.profile!);});
                  realm.write(() => realm.add(newProfile));
                  //final profile = widget.profile!.copyWith(experience: exps);
                  //Hive.box<ProfileModel>('profileBox').putAt(widget.id!, profile);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen(profileId:widget.id!,profile:profile)));
                }
              },
              child: Icon(
                Icons.done_outline,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          for (int i = 0; i < textControllers.length; i++)
            Container(
              width: double.infinity,
              // padding: EdgeInsets.all(20),
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
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                        color: Colors.grey),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Experience ${i + 1}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              textControllers.removeAt(i);
                            });
                          } ,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: textControllers[i]["companyName"],
                          labelText: "Company Name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controller: textControllers[i]["jobTitle"],
                          labelText: "Job Title",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controller: textControllers[i]["startDate"],
                          labelText: "Start Date",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controller: textControllers[i]["endDate"],
                          labelText: "End Date",
                        ),
                        SizedBox(height: 20),
                        CommonTextField(
                          controller: textControllers[i]["details"],
                          labelText: "Details",
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numOfExperince++;
            textControllers.add({
              "companyName": TextEditingController(),
              "jobTitle": TextEditingController(),
              "startDate": TextEditingController(),
              "endDate": TextEditingController(),
              "details": TextEditingController()
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
