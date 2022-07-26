import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:home_automation/models/mqtt_model.dart';

class SwitchAlat extends StatefulWidget {
  static String nameRoute = '/switch';
  const SwitchAlat({Key? key}) : super(key: key);

  @override
  State<SwitchAlat> createState() => _SwitchAlatState();
}

class _SwitchAlatState extends State<SwitchAlat> {
  List<bool> _buttonsState = List.generate(1, (index) => false);
  // TextEditingController data = TextEditingController();
  // Future postData(data) async {
  //   try {
  //     final response = await http.post(
  //         Uri.parse("http://192.168.1.52:4000/api/mqtt"),
  //         body: jsonEncode(<String, String>{'data': 'ON'}));
  //     // body: json.encode({"data": "1"}));
  //     print("Respon: " + response.body);
  //     if (response.statusCode == 200) {
  //       print(response.statusCode);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> toogle(String data) async {
  //   var response = await http.post(
  //       Uri.parse("http://192.168.4.204:4000/user/api"),
  //       body: jsonEncode(<String, String>{'message': 'ON'}));
  //   print("Responsenya: ${response.body}");
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff548E87),
        title: const Text("Switch Device"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.5,
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
                children: [
                  const Text(
                    "Device : Lampu 1",
                    style: TextStyle(
                        color: Color(0xff548E87),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextFormField(
                  //     controller: data,
                  //     style: TextStyle(color: Colors.black),
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: "Data:",
                  //       labelStyle: TextStyle(color: Colors.black),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  ToggleButtons(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Icon(
                          Icons.power_settings_new_outlined,
                          size: 120,
                        ),
                      ),
                    ],
                    isSelected: _buttonsState,
                    selectedColor: Colors.white,
                    fillColor: Colors.teal,
                    splashColor: Colors.teal,
                    selectedBorderColor: Colors.tealAccent,
                    borderWidth: 5,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    onPressed: (int index) {
                      int count = 0;
                      _buttonsState.forEach((bool val) {
                        if (val) count++;
                      });
                      if (_buttonsState[index] && count < 1) return;
                      setState(() {
                        if (_buttonsState[index]) {
                          PostMqtt.connectMqtt("OFF");
                        } else {
                          PostMqtt.connectMqtt("ON");
                        }
                        //postData(data);
                        _buttonsState[index] = !_buttonsState[index];
                      });
                      // setState(() {
                      //   for (int buttonIndex = 0;
                      //       buttonIndex < _buttonsState.length;
                      //       buttonIndex++) {
                      //     if (buttonIndex == index) {
                      //       _buttonsState[buttonIndex] = true;
                      //       toogle(data);
                      //     } else {
                      //       _buttonsState[buttonIndex] = false;
                      //     }
                      //   }
                      // }),
                    },
                  ),
                  // SizedBox(
                  //     height: 160, //height of button
                  //     width: 160, //width of button
                  //     child: ElevatedButton(
                  //         style: ButtonStyle(
                  //           shape: MaterialStateProperty.all(
                  //             RoundedRectangleBorder(
                  //               // Change your radius here
                  //               borderRadius: BorderRadius.circular(90),
                  //             ),
                  //           ),
                  //           backgroundColor:
                  //               MaterialStateProperty.all<Color>(Colors.white),
                  //           overlayColor: MaterialStateProperty.all<Color>(
                  //               const Color(0xff8FC9AE)),
                  //         ),
                  //         ///////////////////TES/////////////
                  //         onPressed: () {
                  //           toogle(data);
                  //           // var response = await http.post(
                  //           //     Uri.parse(
                  //           //         "http://192.168.4.204:4000/user/api/api"),
                  //           //     body: jsonEncode(
                  //           //         <String, String>{'message': data.text}));
                  //           // print("Responsenya: " + response.body);
                  //           //     Uri.parse(
                  //           //         "http://192.168.4.204:4000/user/api/"),
                  //           //     body: jsonEncode(<String> {'data': data.text}));
                  //           // print("Responsenya: " + response.body);
                  //         },
                  //         child: const Icon(
                  //           Icons.power_settings_new_outlined,
                  //           color: Colors.black,
                  //           size: 130,
                  //         ))),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Status : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "OFF",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: size.height * 0.4,
              width: size.width * 1,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Device Information",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                      height: 50, //height of button
                      width: 500, //width of button
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 202, 199, 199)),
                            overlayColor: MaterialStateProperty.all(
                                const Color(0xff8FC9AE)),
                          ),
                          onPressed: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const ConWifi();
                            // }));
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.edit_note,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Name : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "Lampu 1",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 105),
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ))),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 50, //height of button
                      width: 500, //width of button
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 202, 199, 199)),
                            overlayColor: MaterialStateProperty.all(
                                const Color(0xff8FC9AE)),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Location : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "My Room",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 75),
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ))),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 50, //height of button
                      width: 500, //width of button
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 202, 199, 199)),
                            overlayColor: MaterialStateProperty.all(
                                const Color(0xff8FC9AE)),
                          ),
                          onPressed: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const ConWifi();
                            // }));
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.history,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "History : ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 170),
                              Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
