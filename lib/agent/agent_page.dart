import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:welapp/admin/editeUsers.dart';
import 'package:welapp/agent/derUsers.dart';
import 'package:welapp/login.dart';
import 'package:rxdart/rxdart.dart';
import 'contact.dart';
import 'new_client.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  bool _isTapped = false;
  final checkRef = FirebaseFirestore.instance.collection('derangemnts'); 
  final Stream<QuerySnapshot> _usersStreamm = FirebaseFirestore.instance.collection('clients').snapshots();     //.doc().collection('Derangements').snapshots() 
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('derangements').snapshots();  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void mssgStreams() async {
    await for (var snapshot in _firestore.collection('hhh').snapshots()) {
      for (var m in snapshot.docs) {
        m.data();
      }
    }
  }

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
                          //onClick();
                        },
                        child: Card(
                          margin: const EdgeInsets.all(4),
                          elevation: 8,
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['der'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Text(
                                //   snapshot.data!.docChanges[index].doc['ID'],
                                //   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),
                                // ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['date'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black54),
                                ),
                                const SizedBox(width: 10),
                                // Text(
                                //   snapshot.data!.docChanges[index].doc['Prenom.Email'],
                                //   style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black54),
                                // ),
                              ],
                            ),
                            trailing: Icon(Icons.more_horiz,size: 30,),
                            //contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
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

      //  Padding(
      //    padding: const EdgeInsets.only(top: 200),
      //    child: Expanded(
      //      child: StreamBuilder(
      //           stream: CombineLatestStream.combine2(
      //       FirebaseFirestore.instance.collection('clients').snapshots(),
      //       FirebaseFirestore.instance.collection('hhh').snapshots(),
      //       (QuerySnapshot usersSnapshot, QuerySnapshot customersSnapshot) {
      //         List<DocumentSnapshot> combined = [];
      //         combined.addAll(usersSnapshot.docs);
      //         combined.addAll(customersSnapshot.docs);
      //         return combined;
      //       },
      //          ),
      //          builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
      //       if (!snapshot.hasData) {
      //         return CircularProgressIndicator();
      //       }
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) => ListTile(
      //           //title: Text(snapshot.data![index]['Nom']),
      //           subtitle: Text(snapshot.data![index]['ID']),
      //         ),
      //       );
      //          },
      //         ),
      //    ),
      //  )
        ],
      ),
      
       
      
    );
  }
  
  void onClick() {

    // Créer un nouvel objet de vérification
    final newCheckin = {
        // remplacer par l'identifiant de l'utilisateur qui clique
        'timestamp': DateTime.now(), // la date et l'heure de l'action
        'text': 'view', // le texte cliqué

    };
    checkRef.add(newCheckin);
  }
}