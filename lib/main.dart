import 'dart:io';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:resumebuilder_realm/screens/home_screen.dart';
import 'package:resumebuilder_realm/screens/models/education_model.dart';
import 'package:resumebuilder_realm/screens/models/experince_model.dart';
import 'package:resumebuilder_realm/screens/models/language_model.dart';
import 'package:resumebuilder_realm/screens/models/objective_model.dart';
import 'package:resumebuilder_realm/screens/models/personal_details_model.dart';
import 'package:resumebuilder_realm/screens/models/profile_model.dart';
import 'package:resumebuilder_realm/screens/models/project_model.dart';
import 'package:resumebuilder_realm/screens/models/skill_model.dart';

late Realm realm;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  realm = await initRealm();
    // Initialize hive
  //await Hive.initFlutter();
  // Registering the adapter
  // Hive.registerAdapter(EducationModelAdapter());
  // Hive.registerAdapter(ExperienceModelAdapter());
  // Hive.registerAdapter(ProfileModelAdapter());
  // Hive.registerAdapter(LanguageModelAdapter());
  // Hive.registerAdapter(ObjectiveModelAdapter());
  // Hive.registerAdapter(PersonalDetailsModelAdapter());
  // Hive.registerAdapter(ProjectModelAdapter());
  // Hive.registerAdapter(SkillModelAdapter());
  // // Opening the box
  // //await Hive.openBox('userBox');
  //   await Hive.openBox<ProfileModel>('profileBox');
  runApp(const MyApp());
}

Future<Realm> initRealm() async {
  final config = Configuration.local([EducationModel.schema,ExperienceModel.schema,LanguageModel.schema,ObjectiveModel.schema,PersonalDetailsModel.schema,ProfileModel.schema,ProjectModel.schema,SkillModel.schema]);
  final file = File(config.path);
  // await file.delete(); // <-- uncomment this to start over on every restart
  // if (!await file.exists()) {
  //   ByteData realmBytes = await rootBundle.load(assetKey);
  //   await file.writeAsBytes(
  //     realmBytes.buffer.asUint8List(realmBytes.offsetInBytes, realmBytes.lengthInBytes),
  //     mode: FileMode.write,
  //   );
  // }
  return Realm(config);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
