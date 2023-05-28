import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/cllient/mes_lignes.dart';
import 'package:welapp/cllient/p_fact.dart';

class MesFactureCl extends StatefulWidget {
  const MesFactureCl({super.key});

  @override
  State<MesFactureCl> createState() => _MesFactureClState();
}

class _MesFactureClState extends State<MesFactureCl> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context){
    String uid = _auth.currentUser!.uid;
    return Scaffold(
      // body: Stack(
      //   children: [
      //     Positioned(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           //SizedBox(height: 20,),
      //           Container(
      //             height: 200,
      //             decoration: BoxDecoration(
      //               color: Color.fromARGB(255, 107, 189, 227),
      //               borderRadius: const BorderRadius.only(
      //                 //bottomLeft: Radius.circular(80)
      //               ),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(20.0),
      //               child: Column(
      //                 children: [
                        
      //                 AppBar(
      //                   backgroundColor: Colors.transparent,
      //                   elevation: 0.0,
      //                   leading: IconButton(
                          
      //                     icon: Icon(
      //                       Icons.arrow_back_ios,
      //                       size: 30,
      //                     ),
      //                     onPressed: () {
      //                       Navigator.pop(context);
      //                     },
      //                   ),
      //                   //////////////
      //                   actions: <Widget>[
                          
      //                     IconButton(
      //                       onPressed: () {}, icon: Icon(Icons.person),iconSize: 30,),
      //                     ///////////
      //                     IconButton(
      //                       onPressed: () {
      //                         // ScaffoldMessenger.of(context).showSnackBar(
      //                         // const SnackBar(content: Text('This is a snackbar')));
      //                       },
      //                       icon: const Icon(
      //                         Icons.message,
      //                       ),
      //                       iconSize: 30,
      //                       tooltip: 'Show Snackbar',
      //                     ),
                          
      //                   ],
      //                 ),
      //                 Column(
      //                   children: [
      //                     Text(
      //                       'Mes Factures',
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 30,
      //                         fontFamily: 'Inspiration',
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
                          
                        
      //                     // MaterialButton(
      //                     //   onPressed: (){
      //                     //     FirebaseAuth.instance.signOut();
      //                     //   },
      //                     //   color: Colors.blue,
      //                     //   child: Text('sign out'),
      //                     //   ), 
                          
      //                   ],
      //                 ),
      //                 ]
      //               ),
      //             ),
              
                  
      //           ) 
               
      //         ],
      //       ),
      //     ),
      //   ]
      // ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("\nMes Factures"),
            
            StreamBuilder<QuerySnapshot>(
             //stream: FirebaseFirestore.instance.collection("Products").snapshots(),
              stream: FirebaseFirestore.instance.collection("clients").doc(uid).collection("Factures").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData) {
                  final snap = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      final bool condition = snap[index]['paye'];
                      final String _buttonText = snap[index]['pname'];
                      return Container(
                        height: 70,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20,top: 18),
                              //alignment: Alignment.centerLeft,
                              child: Text(
                                snap[index]['name'],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 220,top: 20),
                              //alignment: Alignment.centerRight,
                              child: Text(
                                "\ ${snap[index]['price']} MAD",
                                style: TextStyle(
                                  color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20,bottom: 10),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                snap[index]['date'],
                                style: TextStyle(
                                  color: Colors.green.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20,bottom: 0),
                              alignment: Alignment.bottomRight,
                              
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: condition ? MaterialStateProperty.all(Color.fromARGB(255, 199, 198, 198)) : MaterialStateProperty.all(Colors.blue),
                                  minimumSize: MaterialStateProperty.all(Size(15, 15)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PFactPage(docid: snapshot.data!.docs[index],)));
                                },
                                child: Text(
                                _buttonText,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              // style: ElevatedButton.styleFrom(
                              //   minimumSize: Size(5,5),
                              //   // autres propriétés de style
                              // ),
                              
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),

    );
  }  
}
