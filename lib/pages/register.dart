import 'package:flutter/material.dart';

import 'package:home_automation/pages/login.dart';

class Register extends StatefulWidget {
  static String nameRoute = '/register';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
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
                  const Text(
                    'Daftar',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: Color(0xff548E87)),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_box,
                          color: Color(0xff548E87),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            color: Color(0xff548E87),
                            width: 2.0,
                          ),
                        ),
                        labelText: "Username",
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
                      controller: password1,
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
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: _isObscure,
                      controller: password2,
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
                          labelText: "Re-Password",
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
                                Navigator.of(context)
                                    .pushNamed(Login.nameRoute);
                              },
                              child: const Text(
                                "DAFTAR",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              )))),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sudah punya akun?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Login.nameRoute);
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff548E87)),
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
