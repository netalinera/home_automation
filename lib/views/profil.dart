import 'package:flutter/material.dart';
import 'package:home_automation/pages/edit_pass.dart';

class Profil extends StatefulWidget {
  static String nameRoute = '/profil';
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Me",
                  style: TextStyle(
                      color: Color(0xff385B66),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Username",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 80),
                      Center(
                          child: SizedBox(
                              height: 50, //height of button
                              width: 300, //width of button
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 202, 199, 199)),
                                    overlayColor: MaterialStateProperty.all(
                                        const Color(0xff8FC9AE)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(EditPassword.nameRoute);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.key,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Ubah Password",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 70),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.black,
                                      ),
                                    ],
                                  )))),
                      const SizedBox(height: 30),
                      Center(
                          child: SizedBox(
                              height: 50, //height of button
                              width: 300, //width of button
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 202, 199, 199)),
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
                                    children: const [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Log Out",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
