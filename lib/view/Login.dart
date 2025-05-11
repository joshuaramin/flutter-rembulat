import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const insertForm();
  }
}

class insertForm extends StatefulWidget {
  const insertForm({super.key});

  @override
  State<insertForm> createState() => _insertFormState();
}

class _insertFormState extends State<insertForm> {
  final jrFullNameControler = TextEditingController();
  final jrEmailController = TextEditingController();
  final jrUsernameController = TextEditingController();
  final jrPasswordController = TextEditingController();

  @override
  void dispose() {
    jrFullNameControler.dispose();
    jrEmailController.dispose();
    jrUsernameController.dispose();
    jrPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(60),
          child: Form(
            child: ListView(
              children: [
                TextFormField(
                  controller: jrFullNameControler,
                  decoration: const InputDecoration(labelText: "Full Name"),
                ),
                TextFormField(
                  controller: jrEmailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: jrUsernameController,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                TextFormField(
                  controller: jrPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("tbl_Users").add({
                      'email': jrEmailController.text,
                      'fullname': jrFullNameControler.text,
                      'username': jrUsernameController.text,
                      'password': jrPasswordController.text,
                    });
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
