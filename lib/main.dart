import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intelogsapp/WelcomeScreen/welcome_screen.dart';
import 'package:intelogsapp/intellogs_assets/asset_group/assets_group_details.dart';
import 'package:intelogsapp/organization/employees/EmployeesPage.dart';
import 'package:intelogsapp/organization/employees/employeeProfilePage.dart';
import 'package:intelogsapp/organization/section/sectionListPage.dart';
import 'LoginScreen.dart';
import 'organization/SkillGroup/skillsGroup.dart';
import 'organization/roles/addPermission.dart';
import 'organization/section/addSections.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          hintColor: Colors.amber.shade400,
          primaryColor:  Colors.amber.shade400,
          fontFamily: "Montserrat",
          //canvasColor: Colors.white
      ),
      home: sectionPage('jP1RYdAj'),
     // LoginScreen()
    );
  }
}
