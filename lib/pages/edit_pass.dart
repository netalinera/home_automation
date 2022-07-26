import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home_automation/pages/dashboard.dart';
import 'package:home_automation/views/profil.dart';

class EditPassword extends StatefulWidget {
  static String nameRoute = '/editpassword';
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController password3 = TextEditingController();
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: const Color(0xff8FC9AE),
        title: const Text(
          "Profil",
          style: TextStyle(
              color: Color(0xff385B66),
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            )),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Ubah Password",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff385B66),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  color:
                      // Color(0xff548E87),
                      Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  )),
              padding: const EdgeInsets.all(2),
              child: TextFormField(
                obscureText: _isObscure1,
                controller: password1,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: const Color(0xff548E87),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: Color(0xff548E87),
                        width: 2.0,
                      ),
                    ),
                    labelText: "Password Lama",
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      color: const Color(0xff548E87),
                      icon: Icon(
                        _isObscure1 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                  color:
                      // Color(0xff548E87),
                      Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  )),
              padding: const EdgeInsets.all(2),
              child: TextFormField(
                obscureText: _isObscure2,
                controller: password2,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff548E87),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: Color(0xff548E87),
                        width: 2.0,
                      ),
                    ),
                    labelText: "Password Baru",
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      color: const Color(0xff548E87),
                      icon: Icon(
                        _isObscure2 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure2 = !_isObscure2;
                        });
                      },
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                  color:
                      // Color(0xff548E87),
                      Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  )),
              padding: const EdgeInsets.all(2),
              child: TextFormField(
                obscureText: _isObscure3,
                controller: password3,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff548E87),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: Color(0xff548E87),
                        width: 2.0,
                      ),
                    ),
                    labelText: "Re-Password Baru",
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      color: const Color(0xff548E87),
                      icon: Icon(
                        _isObscure3 ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure3 = !_isObscure3;
                        });
                      },
                    )),
              ),
            ),
            const SizedBox(height: 30),
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff548E87)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        )))),
          ],
        ),
      ),
    );
  }
}
