import 'package:flutter/material.dart';
import 'package:welapp/cllient/client_page.dart';
import 'package:welapp/espace/admin_page.dart';
import 'package:welapp/espace/agent_page.dart';
import 'package:welapp/welcome/welcome.dart';


class ForgetPassCl extends StatelessWidget {
  const ForgetPassCl({super.key});

  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget password'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back1.jpg'),
              fit: BoxFit.cover
            ),
          ),
        
        
        
        
      ),
    );
  }
}