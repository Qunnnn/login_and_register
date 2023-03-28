import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser?.email;
    void userSignOut() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: userSignOut, icon: Icon(Icons.logout))
      ]),
      body: Center(
        child: Text(
          'Welcome $user',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
