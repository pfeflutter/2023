import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotPage extends StatefulWidget {
  const NotPage({super.key});

  @override 
  State<NotPage> createState() => _NotPageState();
}

class _NotPageState extends State<NotPage> { 
  User? userId = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
                          // actions: <Widget>[
                          //   IconButton(onPressed: () {}, icon: Icon(Icons.person),iconSize: 30,),
                          //   ///////////
                          //   IconButton(
                          //     onPressed: () {
                          //       // ScaffoldMessenger.of(context).showSnackBar(
                          //       // const SnackBar(content: Text('This is a snackbar')));
                          //     },
                          //     icon: const Icon(
                          //       Icons.notifications,
                          //     ),
                          //     iconSize: 30,
                          //     tooltip: 'Show Snackbar',
                          //   ),
                          
                          // ],
                        ),

                        Column(
                          children: [
                            Text(
                              '',
                              style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Inspiration',fontWeight: FontWeight.bold,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:200),
            child: Container(
              margin: EdgeInsets.all(8),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                  .collection('derangements')
                  .where("Nom.ID",isEqualTo: userId?.uid)
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
                        itemBuilder: (context,index){
                          bool id = snapshot.data!.docs[index]['resolue'];
                          // var nom = snapshot.data!.docs[index]['Nom'];
                          // var prenom = snapshot.data!.docs[index]['Prenom'];
                          // var email = snapshot.data!.docs[index]['Email'];
                          // var cin = snapshot.data!.docs[index]['CNI'];
                          // var phone = snapshot.data!.docs[index]['Phone'];
                          // var ville = snapshot.data!.docs[index]['Ville'];
                          // var adresse = snapshot.data!.docs[index]['Adresse'];
                          return Card(
                            margin: const EdgeInsets.all(1),
                            elevation: 20,
                            child: Column(
                              children: [
                                //ListTile(title: Row(
                                //  children: [
                                //    Text('ID :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                //    Text(id),
                                //    ],
                                //  )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        //Text('NOM :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                        id != true ? 
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(snapshot.data!.docs[index]['der'],style: TextStyle(fontWeight: FontWeight.bold),),
                                              Text('n\'a pas encore résolue'),
                                            ],
                                          ) : Column(
                                            children: [
                                              Text(snapshot.data!.docs[index]['der'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                                              Text('a été resoudre a :'),
                                              Text(snapshot.data!.docs[index]['updatedAtres'])
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ), 
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
        ],
      ),
    );
  }  
}
