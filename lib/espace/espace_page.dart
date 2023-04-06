import 'package:flutter/material.dart';
import 'package:welapp/admin/admin_page.dart';
import 'package:welapp/auth.dart';
import 'package:welapp/auth2.dart';
import 'package:welapp/auth3.dart';



class EspacePage extends StatelessWidget {
  const EspacePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 201, 201),
        title: const Text(
          'TELE LIGHTS',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        
        elevation: 10,      
        
        leading: Container(
          padding: const EdgeInsets.all(5),
          
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Auth()));
                    },
                    child: Container(
                      //width: 150,
                      height: 250,
                      margin: const EdgeInsets.all(15.0),
                      //padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey,width: 3),
                        // borderRadius: BorderRadius.all(Radius.circular(10))
                        // border: Border(bottom: BorderSide(width: 3)),
                        borderRadius: BorderRadius.circular(12),
                        //color: Colors.amber,
                        image: const DecorationImage(
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
                  const SizedBox(height: 10),
        
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Auth3()));
                    },
                    child: Container(
                      //width: double.infinity,
                      //width: size.width*0.44,
                      height: 100,
                      margin: const EdgeInsets.all(15.0),
                      //padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey,width: 3),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 250, 230, 230),
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
                      child: const Center(
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
                  const SizedBox(height: 0),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Auth2()));
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AdminPage()));
                    },
                    child: Container(
                      //width: double.infinity,
                      //width: 200,
                      height: 100,
                      margin: const EdgeInsets.all(15),
                      //padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey,width: 3),
                        // borderRadius: BorderRadius.all(Radius.circular(10))
                        // //border: Border(bottom: BorderSide(width: 3)),

                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 250, 230, 230),
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
                      child: const Center(
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