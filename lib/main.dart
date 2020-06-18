import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'WelcomeScreen/welcome_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Colors.amber.shade400,
          primaryColor:  Colors.amber.shade400,
          fontFamily: "Montserrat",
          canvasColor: Colors.transparent),
      home: WelcomeScreen(),
    );
  }
}
