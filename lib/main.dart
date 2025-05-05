import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const mainPage());
}

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: insertForm());
  }
}

class insertForm extends StatefulWidget {
  const insertForm({super.key});

  @override
  State<insertForm> createState() => _insertFormState();
}

class _insertFormState extends State<insertForm> {
  @override
  var jrFullNameControler = TextEditingController();
  var jrEmailController = TextEditingController();
  var jrUsernameController = TextEditingController();
  var jrPasswordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(60),
          child: Form(
            child: ListView(
              children: [
                TextFormField(
                  controller: jrFullNameControler,
                  decoration: InputDecoration(labelText: "Full Name"),
                ),
                TextFormField(
                  controller: jrEmailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: jrUsernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextFormField(
                  controller: jrPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("tbl_Users").add({
                      'email': jrEmailController.text,
                      'fullname': jrFullNameControler.text,
                      'username': jrUsernameController.text,
                      'password': jrPasswordController.text,
                    });
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
