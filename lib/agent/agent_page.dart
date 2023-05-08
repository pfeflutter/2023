import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:welapp/admin/editeUsers.dart';
import 'package:welapp/agent/derUsers.dart';
import 'package:welapp/login.dart';

import 'contact.dart';
import 'new_client.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('clients').snapshots();     //.doc().collection('Derangements').snapshots() 

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewCl()));
      //   },
      //   child: const Icon(Icons.add),
      // ),
      body: Stack(
        children: [
          Positioned(
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 20,),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 107, 189, 227),
                    borderRadius: BorderRadius.only(
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
                          
                          icon: const Icon(
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
                            onPressed: () {
                                //Navigator.pop(context);
                            FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  LoginPage(),
                              ),
                            );
                            },
                            icon: const Icon(Icons.exit_to_app),iconSize: 30,),
                          ///////////
                          IconButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              // const SnackBar(content: Text('This is a snackbar')));
                            },
                            icon: const Icon(
                              Icons.notifications_active,
                            ),
                            iconSize: 30,
                            tooltip: 'Show Snackbar',
                          ),
                          
                        ],
                      ),
                      Column(
                        children:  [
                          Text(
                            'Espace Agent',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Inspiration',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //Time
                              Text(
                                '${time.year}-${time.month}-${time.day}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '${time.hour}:${time.minute}:${time.second}',
                                style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                        ],
                      ),
                      ]
                    ),
                  ),
                ) 
               
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:0),
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: _usersStream,
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                         if(snapshot.hasError) {
                return const Text('something is wrong');
              }
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
                         return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 230),
                child: Container(
                  height: 600,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>DerUsers(docid: snapshot.data!.docs[index],)));
                        },
                        child: Card(
                          margin: const EdgeInsets.all(4),
                          elevation: 8,
                          child: ListTile(
                            leading: Icon(Icons.person,size: 40,),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   side: BorderSide(
                            //     color: Colors.black,
                            //   ),
                            // ),
                            title: Row(
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['CNI'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['Nom'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black54),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  snapshot.data!.docChanges[index].doc['Prenom'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black54),
                                ),
                              ],
                            ),
                            //econtentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
      
       
      
    );
  }
}