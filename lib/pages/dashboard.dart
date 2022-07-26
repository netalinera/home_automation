import 'package:flutter/material.dart';
import 'package:home_automation/views/home.dart';
import 'package:home_automation/views/profil.dart';
import 'package:home_automation/views/scan.dart';

class Dashboard extends StatefulWidget {
  static String nameRoute = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedPage = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    QRViewExample(),
    const Profil(),
  ];

  // ignore: non_constant_identifier_names
  void _onPageTapped(int Page) {
    setState(() {
      _selectedPage = Page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0.5,
      //   centerTitle: true,
      //   backgroundColor: const Color(0xff8FC9AE),
      //   title: Row(
      //     children: [
      //       Image.asset(
      //         'assets/logo.png',
      //         width: 40,
      //         height: 40,
      //       ),
      //       const SizedBox(width: 10),
      //       const Text(
      //         "Home Automation",
      //         style: TextStyle(
      //             color: Color(0xff385B66),
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20.0),
      //         textAlign: TextAlign.center,
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff548E87),
        selectedFontSize: 13,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_sharp),
            label: 'Add Device',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.white,
        onTap: _onPageTapped,
      ),
    );
  }
}
