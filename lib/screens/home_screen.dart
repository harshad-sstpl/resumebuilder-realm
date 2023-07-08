import 'package:flutter/material.dart';
import 'package:resumebuilder_realm/main.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/profile_screens.dart';
import 'package:resumebuilder_realm/screens/resume_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Builder"),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: 
      // StreamBuilder(
      //     stream: realm.all<ProfileModel>().changes,
      //     builder: (context, snapshot) {
      //       final users = snapshot.data;
      //       return 
            ListView.builder(
                shrinkWrap: true,
                itemCount:realm.all<ProfileModel>().length,
                itemBuilder: (context, index) {
                  var users = realm.all<ProfileModel>()[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  users.personalDetails!.name.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple[600]),
                                ),
                                Text(
                                  users.personalDetails!.email,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(users.dateTimeCreated!,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen(
                                          profileId: index, profile: users)),
                                );
                                //                       final user=UserModel(name: "LKKJJJ", mobile: "769859515",
                                // profile: ProfileModel(surname: "jasoliya", age: "21", gender:"Male")
                                //  ,email: "jasoliyaharshad@gmail.com", orders: [OrderModel( quantity:2 , price: 21),OrderModel(productName: "book", quantity:3 , price: 42)]);
                                // Hive.box<UserModel>('userBox').putAt(index,user);
                              },
                              child: Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.shade300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple[700]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResumeScreen(
                                          profileId: index, profile: users)),
                                );
                                //                       final user=UserModel(name: "LKKJJJ", mobile: "769859515",
                                // profile: ProfileModel(surname: "jasoliya", age: "21", gender:"Male")
                                //  ,email: "jasoliyaharshad@gmail.com", orders: [OrderModel( quantity:2 , price: 21),OrderModel(productName: "book", quantity:3 , price: 42)]);
                                // Hive.box<UserModel>('userBox').putAt(index,user);
                              },
                              child: Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.shade300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "View",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple[700]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              // onTap: () {
                              //   Hive.box<ProfileModel>('profileBox')
                              //       .deleteAt(index);
                              // },
                              child: Container(
                                width: 90,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.shade300),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple[700]),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                  // Column(
                  //   children: [
                  //     Text(users!.dateTimeCreated!),
                  //     Text(users!.personalDetails!.name),
                  //     Text(users.personalDetails!.address),
                  //     Text(users.personalDetails!.email),
                  //     Text(users.personalDetails!.dob),
                  //     if (users.education.isNotEmpty)
                  //       Text(users.education[0].course),
                  //     if (users.education.isNotEmpty)
                  //       Text(users.education[0].school),
                  //     if (users.experience.isNotEmpty)
                  //       Text(users.experience[0].companyName),
                  //     if (users.experience.isNotEmpty)
                  //       Text(users.experience[0].jobTitle),
                  //     if (users.language.isNotEmpty)
                  //       Text(users.language[0].language),
                  //     if (users.skill.isNotEmpty)
                  //       Text(users.skill[0].skill),
                  //     if (users.objective!.objective.isNotEmpty)
                  //       Text(users.objective!.objective),
                  //     if (users.project.isNotEmpty)
                  //       Text(users.project[0].title),

                  //     ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => ProfileScreen(
                  //                     profileId: index, profile: users)),
                  //           );
                  //           //                       final user=UserModel(name: "LKKJJJ", mobile: "769859515",
                  //           // profile: ProfileModel(surname: "jasoliya", age: "21", gender:"Male")
                  //           //  ,email: "jasoliyaharshad@gmail.com", orders: [OrderModel( quantity:2 , price: 21),OrderModel(productName: "book", quantity:3 , price: 42)]);

                  //           // Hive.box<UserModel>('userBox').putAt(index,user);
                  //         },
                  //         child: const Text("Update")),
                  //         ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => ResumeScreen(
                  //                     profileId: index, profile: users)),
                  //           );
                  //           //                       final user=UserModel(name: "LKKJJJ", mobile: "769859515",
                  //           // profile: ProfileModel(surname: "jasoliya", age: "21", gender:"Male")
                  //           //  ,email: "jasoliyaharshad@gmail.com", orders: [OrderModel( quantity:2 , price: 21),OrderModel(productName: "book", quantity:3 , price: 42)]);
                  //           // Hive.box<UserModel>('userBox').putAt(index,user);
                  //         },
                  //         child: const Text("View")),
                  //         ElevatedButton(
                  //         onPressed: () {
                  //            Hive.box<ProfileModel>('profileBox').deleteAt(index);
                  //         },
                  //         child: const Text("Delete"))
                  //   ],
                  // );
          //      });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
