import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';

class ResumeScreen extends StatefulWidget {
  final int? profileId;
  final ProfileModel? profile;
  const ResumeScreen({Key? key, this.profileId, this.profile})
      : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.deepPurple[600],
          title: Text(
            "Your Resume",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                  ),
                ]),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                shape: BoxShape.circle),
                            child: Container(
                              height: 63,
                              width: 63,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8OTMzODgxMXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=420&q=60",
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            widget.profile!.personalDetails!.name.toUpperCase(),
                            style: GoogleFonts.openSans(
                                fontSize: 14, color: Colors.blue),
                          ),
                          Text(
                            widget.profile!.personalDetails!.address,
                            style: GoogleFonts.openSans(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.profile!.personalDetails!.email,
                            style: GoogleFonts.openSans(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.profile!.personalDetails!.phone,
                            style: GoogleFonts.openSans(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.blue,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "OBJECTIVE",
                                    style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                widget.profile!.objective!.objective,
                                style: GoogleFonts.openSans(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          customTitle("SKILL"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < widget.profile!.skill.length;
                                    i++)
                                  customBulletRow(
                                      widget.profile!.skill[i].skill),
                                //customBulletRow("Dart"),
                                //customBulletRow("C/C++"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          customTitle("LANGUAGES"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < widget.profile!.language.length;
                                    i++)
                                  customBulletRow(
                                      widget.profile!.language[i].language),
                                //customBulletRow("Gujarati"),
                                //customBulletRow("Hindi"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          customTitle("EXPERIENCE"),
                          Column(
                            children: [
                              for (int i = 0;
                                  i < widget.profile!.experience.length;
                                  i++)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${widget.profile!.experience[i].startDate}",
                                                style: GoogleFonts.openSans(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                "${widget.profile!.experience[i].endDate}",
                                                style: GoogleFonts.openSans(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                widget.profile!.experience[i]
                                                    .companyName,
                                                style: GoogleFonts.openSans(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                widget.profile!.experience[i]
                                                    .jobTitle,
                                                style: GoogleFonts.openSans(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                widget.profile!.experience[i]
                                                    .details,
                                                style: GoogleFonts.openSans(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500))
                                          ],
                                        ))
                                  ],
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          customTitle("EDUCATION"),
                          Column(
                            children: [
                              for (int i = 0;
                                  i < widget.profile!.education.length;
                                  i++)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        flex: 1,
                                        child: Text(
                                            widget.profile!.education[i].year,
                                            style: GoogleFonts.openSans(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500))),
                                    SizedBox(width: 20),
                                    Flexible(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                widget.profile!.education[i]
                                                    .school,
                                                style: GoogleFonts.openSans(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                widget.profile!.education[i]
                                                    .course,
                                                style: GoogleFonts.openSans(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                widget.profile!.education[i]
                                                    .score,
                                                style: GoogleFonts.openSans(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500))
                                          ],
                                        ))
                                  ],
                                ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          customTitle("PROJECTS"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0;
                                  i < widget.profile!.project.length;
                                  i++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.profile!.project[i].title,
                                        style: GoogleFonts.openSans(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                    Text(widget.profile!.project[i].detasils,
                                        style: GoogleFonts.openSans(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTitle(String title) {
    return Container(
      height: 20,
      width: double.infinity,
      color: Colors.blue,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: GoogleFonts.openSans(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }

  Widget customBulletRow(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        ),
        SizedBox(
          width: 10,
        ),
        Text(title,
            style:
                GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w500))
      ],
    );
  }
}
