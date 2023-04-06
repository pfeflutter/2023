import 'package:flutter/material.dart';

class MonCompteCl extends StatefulWidget {
  const MonCompteCl({super.key});

  @override
  State<MonCompteCl> createState() => _MonCompteClState();
}

class _MonCompteClState extends State<MonCompteCl> {
   
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 20,),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 107, 189, 227),
                    borderRadius: const BorderRadius.only(
                      //bottomLeft: Radius.circular(80)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        leading: IconButton(
                          
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        //////////////
                        actions: <Widget>[
                          
                          IconButton(
                            onPressed: () {}, icon: Icon(Icons.person),iconSize: 30,),
                          ///////////
                          IconButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              // const SnackBar(content: Text('This is a snackbar')));
                            },
                            icon: const Icon(
                              Icons.message,
                            ),
                            iconSize: 30,
                            tooltip: 'Show Snackbar',
                          ),
                          
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Mon Compte',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Inspiration',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        
                          // MaterialButton(
                          //   onPressed: (){
                          //     FirebaseAuth.instance.signOut();
                          //   },
                          //   color: Colors.blue,
                          //   child: Text('sign out'),
                          //   ), 
                          
                        ],
                      ),
                      ]
                    ),
                  ),
              
                  
                ) 
               
              ],
            ),
          ),
        ]
      ),
    );
  }  
}
