import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resumebuilder_realm/main.dart';
import 'package:resumebuilder_realm/screens/models/education_model.dart';
import 'package:resumebuilder_realm/screens/models/objective_model.dart';
import 'package:resumebuilder_realm/screens/models/personal_details_model.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/widgets/common_textfield.dart';

class EducationDetailsScreen extends StatefulWidget {
  final int? id;
  final ProfileModel? profile;
  const EducationDetailsScreen({super.key, this.id, this.profile});

  @override
  State<EducationDetailsScreen> createState() => _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends State<EducationDetailsScreen> {
  int numOfEducation = 1;
  List textControllers = [
    {
      "course": TextEditingController(),
      "school": TextEditingController(),
      "score": TextEditingController(),
      "year": TextEditingController()
    }
  ];

  @override
  void initState() {
    if (widget.profile != null) {
      for (int i = 1; i < widget.profile!.education.length; i++) {
        textControllers.add({
          "course": TextEditingController(),
          "school": TextEditingController(),
          "score": TextEditingController(),
          "year": TextEditingController()
        });
      }
      for (int i = 0; i < widget.profile!.education.length; i++) {
        textControllers[i]["course"].text = widget.profile!.education[i].course;
        textControllers[i]["school"].text = widget.profile!.education[i].school;
        textControllers[i]["score"].text = widget.profile!.education[i].score;
        textControllers[i]["year"].text = widget.profile!.education[i].year;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "Education",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
              onTap: () {
                if (widget.id == null) {
                  List<EducationModel> edus = [];
                  for (int i = 0; i < textControllers.length; i++) {
                    edus.add(EducationModel(
                        course: textControllers[i]["course"].text,
                        school: textControllers[i]["school"].text,
                        score: textControllers[i]["score"].text,
                        year: textControllers[i]["year"].text));
                  }
                  final profile = ProfileModel(
                      dateTimeCreated:
                          "${DateFormat.yMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",
                      education: edus,
                      personalDetails:PersonalDetailsModel() ,
                      objective: ObjectiveModel());
                  realm.write(() {
                    realm.add(profile);
                  });
                  //Hive.box<ProfileModel>('profileBox').add(profile);
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  List<EducationModel> edus = [];
                  for (int i = 0; i < textControllers.length; i++) {
                    edus.add(EducationModel(
                        course: textControllers[i]["course"].text,
                        school: textControllers[i]["school"].text,
                        score: textControllers[i]["score"].text,
                        year: textControllers[i]["year"].text));
                  }
                  ProfileModel newProfile = ProfileModel(
                    personalDetails: widget.profile!.personalDetails,
                    objective: widget.profile!.objective,
                    dateTimeCreated: widget.profile!.dateTimeCreated,
                    education:edus,
                    experience: widget.profile!.experience,
                    skill:widget.profile!.skill,
                    project: widget.profile!.project,
                    language:widget.profile!.language
                  );
                  realm.write(() {realm.delete<ProfileModel>(widget.profile!);});
                  realm.write(() => realm.add(newProfile));
                  // realm.write(() {
                  //   widget.profile!.education = edus;
                  // });

                  // final profile = widget.profile!.copyWith(education: edus);
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
        child: Column(
          children: [
            for (int i = 0; i < textControllers.length; i++)
              Container(
                width: double.infinity,
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
                            "Education ${i + 1}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                textControllers.removeAt(i);
                              });
                            },
                            child: const Icon(
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
                            controller: textControllers[i]['course'],
                            labelText: "Course / Degree",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            controller: textControllers[i]['school'],
                            labelText: "School / University",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            controller: textControllers[i]['score'],
                            labelText: "Grade / Score",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            controller: textControllers[i]['year'],
                            labelText: "Year",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numOfEducation++;
            textControllers.add({
              "course": TextEditingController(),
              "school": TextEditingController(),
              "score": TextEditingController(),
              "year": TextEditingController()
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
