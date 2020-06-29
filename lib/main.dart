import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelogsapp/WelcomeScreen/welcome_screen.dart';
import 'LoginScreen.dart';
import 'organization/SkillGroup/skillsGroup.dart';
import 'organization/roles/addPermission.dart';

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
          canvasColor: Colors.transparent),
      home: WelcomeScreen(),
     // LoginScreen()
    );
  }
}
