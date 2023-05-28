import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welapp/cllient/mon_compte.dart';

class MesLignesCl extends StatefulWidget {
  const MesLignesCl({super.key});

  @override
  State<MesLignesCl> createState() => _MesLignesClState();
}

class _MesLignesClState extends State<MesLignesCl> {
  User? userId = FirebaseAuth.instance.currentUser;
   
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 380,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 107, 189, 227),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(80)
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
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MonCompteCl()));
                            }, icon: Icon(Icons.person),iconSize: 30,),
                          ///////////
                          // IconButton(
                          //   onPressed: () {
                          //     // ScaffoldMessenger.of(context).showSnackBar(
                          //     // const SnackBar(content: Text('This is a snackbar')));
                          //   },
                          //   icon: const Icon(
                          //     Icons.message,
                          //   ),
                          //   iconSize: 30,
                          //   tooltip: 'Show Snackbar',
                          // ),
                          
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Mes Lignes',
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
          Padding(
            padding: const EdgeInsets.only(top:200),
            child: Container(
              margin: EdgeInsets.all(8),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                       .collection('clients')
                       .where("ID",isEqualTo: userId?.uid)
                       .snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError){
                   return Text("Something went wrong!");
                 }
                 if(snapshot.connectionState == ConnectionState.waiting){
                   return  Center(
                     child: CupertinoActivityIndicator(),
                   );
                 }
                 if(snapshot.data!.docs.isEmpty){
                   return Text('No Data Found!');
                 }
                 if(snapshot != null && snapshot.data != null){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                                            return Card(
                      child: Column(
                        children: [
                          ListTile(title: Row(
                            children: [
                              Text('Type Ligne : ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              Text(snapshot.data!.docs[index]['Type Ligne']),
                            ],
                          )),
                        ],
                      ),
                    );
                      },
                    ),
                  );
                 }
                 return Container();
                },
              ),
            ),
          ),
        ]
      ),
    );
  }  
}
