import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_rembulat/view/Login.dart';
import 'package:fl_rembulat/view/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int jrcurrentPageIndex = 0;

  final List<Widget> _jrpages = const [MyWidget(), mainPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            jrcurrentPageIndex = index;
          });
        },
        selectedIndex: jrcurrentPageIndex,
        indicatorColor: Colors.amber,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.supervised_user_circle),
            label: "User",
          ),
          NavigationDestination(
            icon: Icon(Icons.app_registration),
            label: "Register",
          ),
        ],
      ),
      body: _jrpages[jrcurrentPageIndex],
    );
  }
}
