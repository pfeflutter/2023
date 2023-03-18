import 'package:flutter/material.dart';
import 'package:welapp/auth.dart';
import 'package:welapp/espace/admin_page.dart';
import 'package:welapp/cllient/client_page.dart';
import 'package:welapp/login/login_admin.dart';
import 'package:welapp/login/login_client.dart';

import '../login/login_agent.dart';
import 'agent_page.dart';


class EspacePage extends StatelessWidget {
  const EspacePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 202, 201, 201),
        title: const Text(
          'TELE LIGHTS',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        
        elevation: 10,      
        
        leading: Container(
          padding: EdgeInsets.all(5),
          
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          
        ),
        centerTitle: true,
      ),

      body: Container(
        
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back1.jpg'),
              fit: BoxFit.cover
            ),
          ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Auth()));
                    },
                    child: Container(
                      //width: 150,
                      height: 250,
                      margin: EdgeInsets.all(15.0),
                      //padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey,width: 3),
                        // borderRadius: BorderRadius.all(Radius.circular(10))
                        // border: Border(bottom: BorderSide(width: 3)),
                        borderRadius: BorderRadius.circular(12),
                        //color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage('assets/images/22.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 80,
                            offset: Offset(-28, -28),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 80,
                            offset: Offset(28, 28),
                            color: Colors.white,
                          ),
                        ]
                        
                      ),
                      // child: Center(
                      //   child: Text(
                      //     'ESPACE CLIENT',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //       //fontFamily: 'Inspiration',
                      //       fontSize: 20,
                      //     ),
                      //   )
                      // ),
                    ),
                  ),
              ///////////////Espace ADMIN
                  SizedBox(height: 10),
        
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminPage()));
                    },
                    child: Container(
                      //width: double.infinity,
                      //width: 200,
                      height: 100,
                      margin: EdgeInsets.all(15.0),
                      //padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey,width: 3),
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 250, 230, 230),
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/22.png'),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: const [
                          BoxShadow(
                            
                            blurRadius: 80,
                            offset: Offset(-28, -28),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 80,
                            spreadRadius: 1,
                            offset: Offset(28, 28),
                            color: Colors.white,
                          ),
                        ]
                        
                      ),
                      child: Center(
                        child: Text(
                          'ESPACe ADMIN',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inspiration',
                            fontSize: 25,
                          ),
                        )
                      ),
                    ),
                  ),
                  /////////////////////////////////ESPACE AGENT
                  SizedBox(height: 0),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AgentPage()));
                    },
                    child: Container(
                      //width: double.infinity,
                     // width: 200,
                      height: 100,
                      margin: EdgeInsets.all(15),
                      //padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey,width: 3),
                        // borderRadius: BorderRadius.all(Radius.circular(10))
                        // //border: Border(bottom: BorderSide(width: 3)),

                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 250, 230, 230),
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/22.png'),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 80,
                            offset: Offset(-28, -28),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 80,
                            offset: Offset(28, 28),
                            color: Colors.white,
                          ),
                        ]
                        
                      ),
                      child: Center(
                        child: Text(
                          'ESPACe AGENT',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inspiration',
                            fontSize: 25,
                          ),
                        )
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}