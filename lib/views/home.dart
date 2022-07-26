import 'package:flutter/material.dart';

import 'package:home_automation/pages/switch.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: const Color(0xff8FC9AE),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              "Home Automation",
              style: TextStyle(
                  color: Color(0xff385B66),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: size.height,
                      width: size.width * 1,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 1),
                              blurRadius: 5,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                  height: 160, //height of button
                                  width: 150, //width of button
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
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff8FC9AE)),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed(SwitchAlat.nameRoute);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/lamp.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "Lampu 1",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ))),
                              const SizedBox(width: 20),
                              SizedBox(
                                  height: 160, //height of button
                                  width: 150, //width of button
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
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 202, 199, 199)),
                                      ),
                                      onPressed: () {
                                        // Navigator.pushReplacement(context,
                                        //     MaterialPageRoute(builder: (context) {
                                        //   return const ConWifi();
                                        // }));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/lamp.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "Lampu 2",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                        ],
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
