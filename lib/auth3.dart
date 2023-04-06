import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/admin/admin_2.dart';
import 'package:welapp/admin/admin_page.dart';

import 'package:welapp/login/login_admin.dart';







class Auth3 extends StatelessWidget {
  const Auth3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return const Myhome();
            return const AdminPage();
          } else {
            return const LoginAdmin();
          }
        },
      ),
    );
  }
}