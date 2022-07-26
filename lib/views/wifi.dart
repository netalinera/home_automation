import 'package:flutter/material.dart';

class ConWifi extends StatefulWidget {
  static String nameRoute = '/wifi';
  const ConWifi({Key? key}) : super(key: key);

  @override
  State<ConWifi> createState() => _ConWifiState();
}

class _ConWifiState extends State<ConWifi> {
  TextEditingController _outputController = TextEditingController();
  TextEditingController ssid = TextEditingController();
  TextEditingController passwordwifi = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 150.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: _outputController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.qr_code_2_outlined,
                              color: Color(0xff548E87),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                color: Color(0xff548E87),
                                width: 2.0,
                              ),
                            ),
                            labelText: "Result",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Select Network',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Color(0xff548E87)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: ssid,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.wifi,
                          color: Color(0xff548E87),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Color(0xff548E87),
                            width: 2.0,
                          ),
                        ),
                        labelText: "SSID",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: _isObscure,
                      controller: passwordwifi,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xff548E87),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                              color: Color(0xff548E87),
                              width: 2.0,
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                            color: const Color(0xff548E87),
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                      child: SizedBox(
                          height: 50, //height of button
                          width: 170, //width of button
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xff548E87)),
                              ),
                              onPressed: () {
                                // Navigator.pushReplacement(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return const Dashboard();
                                // }));
                              },
                              child: const Text(
                                "CONNECT",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              )))),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
