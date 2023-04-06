import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/login/login_agent.dart';

import 'package:welapp/agent/agent_page.dart';





class Auth2 extends StatelessWidget {
  const Auth2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const AgentPage();
          }else{
            return const LoginAgent(); 
          }
        },
      ),
    );
  }
}