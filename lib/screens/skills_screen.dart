import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resumebuilder_realm/main.dart';
import 'package:resumebuilder_realm/screens/models/objective_model.dart';
import 'package:resumebuilder_realm/screens/models/personal_details_model.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/models/skill_model.dart';
import 'package:resumebuilder_realm/screens/widgets/common_textfield.dart';

class SkillDetailsScreen extends StatefulWidget {
  final ProfileModel? profile;
  final int? id;
  const SkillDetailsScreen({super.key, this.id, this.profile});

  @override
  State<SkillDetailsScreen> createState() => _SkillDetailsScreenState();
}

class _SkillDetailsScreenState extends State<SkillDetailsScreen> {
  int numOfskill = 1;
  List textControllers = [TextEditingController()];

  @override
  void initState() {
    if (widget.profile != null) {
      for (int i = 1; i < widget.profile!.skill.length; i++) {
        textControllers.add(TextEditingController());
      }
      for (int i = 0; i < widget.profile!.skill.length; i++) {
        textControllers[i].text = widget.profile!.skill[i].skill;
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
          "Education",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
              onTap: () {
                if (widget.id == null) {
                  List<SkillModel> skills = [];
                  for (int i = 0; i < textControllers.length; i++) {
                    skills.add(SkillModel(skill: textControllers[i].text));
                  }
                  final profile = ProfileModel(
                    personalDetails:PersonalDetailsModel(),
                     objective:ObjectiveModel(),
                      dateTimeCreated:
                          "${DateFormat.yMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",
                      skill: skills);
                  realm.write(() {
                    realm.add(profile);
                  });
                  //Hive.box<ProfileModel>('profileBox').add(profile);
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  List<SkillModel> skills = [];
                  for (int i = 0; i < textControllers.length; i++) {
                    skills.add(SkillModel(skill: textControllers[i].text));
                  }
                  ProfileModel newProfile = ProfileModel(
                      personalDetails: widget.profile!.personalDetails,
                      objective: widget.profile!.objective,
                      dateTimeCreated: widget.profile!.dateTimeCreated,
                      education: widget.profile!.education,
                      experience: widget.profile!.experience,
                      skill: skills,
                      project: widget.profile!.project,
                      language: widget.profile!.language);
                  realm.write(() {
                    realm.delete<ProfileModel>(widget.profile!);
                  });
                  realm.write(() => realm.add(newProfile));
                  //final profile = widget.profile!.copyWith(skill: skills);
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
            for (int i = 0; i < numOfskill; i++)
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
                            "Skill ${i + 1}",
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
                            controller: textControllers[i],
                            labelText: "Skills",
                            maxLines: 2,
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
            numOfskill++;
            textControllers.add(TextEditingController());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
