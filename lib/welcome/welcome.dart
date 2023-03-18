import 'package:flutter/material.dart';
import 'package:welapp/espace/espace_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome Page'),
      // ),
      //backgroundColor: Color.fromARGB(255, 226, 220, 220),

      // 
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back1.jpg'),
              fit: BoxFit.cover
            ),
          ),
          
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
              image: AssetImage('assets/images/logo11.png'),
              //fit: BoxFit.cover
            ),
              // const Text(
              //   'Welcome',
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 2,
              //   ),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 121, 64, 195),
                textStyle: const TextStyle(fontSize: 25),
                padding: const EdgeInsets.fromLTRB(100,20,100,20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EspacePage()));

                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inspiration',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
      ),
      
    );
  }
}