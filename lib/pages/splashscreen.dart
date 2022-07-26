import 'package:flutter/material.dart';
import 'package:home_automation/pages/login.dart';
import 'package:home_automation/pages/register.dart';

class SplashScreen extends StatefulWidget {
  static String nameRoute = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            // width: size.width * 0.5,
                            // height: size.width * 0.5,
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            decoration: const BoxDecoration(
                                color:
                                    // Color(0xff548E87),
                                    Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                )),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 80,
                                ),
                                Center(
                                    child: SizedBox(
                                        height: 50, //height of button
                                        width: 200, //width of button
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  // Change your radius here
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color.fromARGB(
                                                          255, 202, 199, 199)),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xff8FC9AE)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed(Login.nameRoute);
                                            },
                                            child: const Text(
                                              "Log In",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                              ),
                                            )))),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: SizedBox(
                                        height: 50, //height of button
                                        width: 200, //width of button
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  // Change your radius here
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color.fromARGB(
                                                          255, 202, 199, 199)),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      const Color(0xff8FC9AE)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                  Register.nameRoute);
                                            },
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                              ),
                                            )))),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
