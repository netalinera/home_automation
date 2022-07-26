import 'package:flutter/material.dart';
import 'package:home_automation/pages/dashboard.dart';
import 'package:home_automation/pages/edit_pass.dart';
import 'package:home_automation/pages/login.dart';
import 'package:home_automation/pages/register.dart';
import 'package:home_automation/pages/splashscreen.dart';
import 'package:home_automation/views/profil.dart';
import 'package:home_automation/views/scan.dart';
import 'package:home_automation/pages/switch.dart';
import 'package:home_automation/views/wifi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.nameRoute,
      home: const SplashScreen(),
      routes: {
        SplashScreen.nameRoute: ((context) => const SplashScreen()),
        Login.nameRoute: ((context) => const Login()),
        Register.nameRoute: ((context) => const Register()),
        Dashboard.nameRoute: ((context) => const Dashboard()),
        ConWifi.nameRoute: ((context) => const ConWifi()),
        SwitchAlat.nameRoute: ((context) => const SwitchAlat()),
        QRViewExample.nameRoute: ((context) => const QRViewExample()),
        EditPassword.nameRoute: ((context) => const EditPassword()),
        Profil.nameRoute: ((context) => const Profil()),
      },
    );
  }
}
