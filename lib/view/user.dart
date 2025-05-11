import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final users = FirebaseFirestore.instance.collection("tbl_Users");

    return FutureBuilder<QuerySnapshot>(
      future: users.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No Users found.'));
        }

        final jruser = snapshot.data!.docs;

        return ListView.builder(
          itemCount: jruser.length,
          itemBuilder: (context, index) {
            final jrusername = jruser[index];
            final jrdata = jrusername.data() as Map<String, dynamic>;

            return ListTile(
              title: Text(jrdata['username']),
              subtitle: Text(jrdata['email']),
            );
          },
        );
      },
    );
  }
}
    