import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resumebuilder_realm/main.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/models/project_model.dart';
import 'package:resumebuilder_realm/screens/widgets/common_textfield.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final int? id;
  final ProfileModel? profile;
  const ProjectDetailsScreen({super.key,this.id,this.profile});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  int numOfProjects = 1;
  List textControllers = [
    {"title": TextEditingController(), "details": TextEditingController()}
  ];
  
  @override
  void initState() {
    if(widget.profile!=null){
    for(int i=1;i<widget.profile!.project.length;i++){
      textControllers.add({
      "title": TextEditingController(),
      "details": TextEditingController()
    });
    }
    for(int i=0;i<widget.profile!.project.length;i++){
      textControllers[i]["title"].text=widget.profile!.project[i].title;
      textControllers[i]["details"].text=widget.profile!.project[i].detasils;
    }}
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
                if(widget.id==null){
                  List<ProjectModel> projs=[];
                  for(int i=0;i<textControllers.length;i++){
                    projs.add(ProjectModel(title:textControllers[i]["title"].text,detasils: textControllers[i]["details"].text));
                  }
                  final profile=ProfileModel(dateTimeCreated:"${DateFormat.yMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",project:projs);
                  realm.write(() {realm.add(profile);});
                  //Hive.box<ProfileModel>('profileBox').add(profile);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                else{
                  List<ProjectModel> projs=[];
                  for(int i=0;i<textControllers.length;i++){
                    projs.add(ProjectModel(title:textControllers[i]["title"].text,detasils: textControllers[i]["details"].text));
                  }
                  ProfileModel newProfile = ProfileModel(
                    personalDetails: widget.profile!.personalDetails,
                    objective: widget.profile!.objective,
                    dateTimeCreated: widget.profile!.dateTimeCreated,
                    education:widget.profile!.education,
                    experience: widget.profile!.experience,
                    skill:widget.profile!.skill,
                    project: projs,
                    language:widget.profile!.language
                  );
                  realm.write(() {realm.delete<ProfileModel>(widget.profile!);});
                  realm.write(() => realm.add(newProfile));
                  //final profile=widget.profile!.copyWith(project:projs);
                  //Hive.box<ProfileModel>('profileBox').putAt(widget.id!,profile);
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
          for (int i = 0; i < numOfProjects; i++)
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
                          "Project ${i + 1}",
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
                          controller: textControllers[i]["title"],
                          labelText: "Title",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controller: textControllers[i]["details"],
                          labelText: "Details",
                          maxLines: 2,
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
            numOfProjects++;
            textControllers.add({
              "title": TextEditingController(),
              "details": TextEditingController()
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
