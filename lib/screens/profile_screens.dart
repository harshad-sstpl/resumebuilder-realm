import 'package:flutter/material.dart';
import 'package:resumebuilder_realm/screens/education_screen.dart';
import 'package:resumebuilder_realm/screens/experience_details_screen.dart';
import 'package:resumebuilder_realm/screens/languages_screen.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/objective_screen.dart';
import 'package:resumebuilder_realm/screens/personal_details_screen.dart';
import 'package:resumebuilder_realm/screens/projects_screen.dart';
import 'package:resumebuilder_realm/screens/skills_screen.dart';

class ProfileScreen extends StatefulWidget {
  final int? profileId;
  final ProfileModel? profile;
  const ProfileScreen({super.key,this.profileId,this.profile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "View CV",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          GridView(
              shrinkWrap: true,
              padding: EdgeInsets.all(30),
              //itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 3),
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetailsScreen(id: widget.profileId,profile:widget.profile)));
                  },
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.deepPurple, size: 35),
                        Text(
                          "Personal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EducationDetailsScreen(id:widget.profileId,profile:widget.profile,)));
                  } ,
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, color: Colors.deepPurple, size: 35),
                        Text(
                          "Education",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ExperienceDetailsScreen(id:widget.profileId,profile:widget.profile)));
                  } ,
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.deepPurple, size: 35),
                        Text(
                          "Experience",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SkillDetailsScreen(id:widget.profileId,profile:widget.profile)));
                  } ,
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield_rounded,
                            color: Colors.deepPurple, size: 35),
                        Text(
                          "Skills",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ObjectiveDetailsScreen(id:widget.profileId,profile:widget.profile)));
                  } ,
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flag, color: Colors.deepPurple, size: 35),
                        Text(
                          "Objective",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectDetailsScreen(id:widget.profileId,profile:widget.profile)));
                  },
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_copy, color: Colors.deepPurple, size: 35),
                        Text(
                          "Projects",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguageDetailsScreen(id:widget.profileId,profile:widget.profile,)));
                  },
                  child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.language, color: Colors.deepPurple, size: 35),
                        Text(
                          "Languages",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
