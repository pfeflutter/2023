import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonCompteCl extends StatefulWidget {
  const MonCompteCl({super.key});

  @override 
  State<MonCompteCl> createState() => _MonCompteClState();
}

class _MonCompteClState extends State<MonCompteCl> { 
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
                              'Mon Compte',
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
                        itemBuilder: (context,index){
                          var id = snapshot.data!.docs[index]['ID'];
                          var nom = snapshot.data!.docs[index]['Nom'];
                          var prenom = snapshot.data!.docs[index]['Prenom'];
                          var email = snapshot.data!.docs[index]['Email'];
                          var cin = snapshot.data!.docs[index]['CNI'];
                          var phone = snapshot.data!.docs[index]['Phone'];
                          var ville = snapshot.data!.docs[index]['Ville'];
                          var adresse = snapshot.data!.docs[index]['Adresse'];
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
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('NOM :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(nom),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('PRENOM :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(prenom),
                                    ],
                                  )
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('EMAIL :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(email),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('CIN :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(cin),
                                    ],
                                  )
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('PHONE :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(phone),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Modifier'),
                                            content: TextField(
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                //labelText: 'Enter your name',
                                                hintText: phone,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text('Modifier'),
                                                onPressed : () {
                                                  FirebaseFirestore.instance
                                                  .collection('clients')
                                                  .doc(userId?.uid)
                                                  .update({'Phone' : _nameController.text})
                                                  .then((value) => Navigator.pop(context));
                                                },
                                              ),
                                            ],
                                          );
                                        }
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ),
                                /////////////////ville
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('VILLE :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(ville),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Modifier'),
                                            content: TextField(
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                //labelText: 'Enter your name',
                                                hintText: ville,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text('Modifier'),
                                                onPressed : () {
                                                  FirebaseFirestore.instance
                                                  .collection('clients')
                                                  .doc(userId?.uid)
                                                  .update({'Ville' : _nameController.text})
                                                  .then((value) => Navigator.pop(context));
                                                },
                                              ),
                                            ],
                                          );
                                        }
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ),
                                ////////////////////////////////:ADRESSE
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text('ADRESSE :',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(width: 8),
                                      Text(adresse),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Modifier'),
                                            content: TextField(
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                //labelText: 'Enter your name',
                                                hintText: adresse,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text('Annuler'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text('Modifier'),
                                                onPressed : () {
                                                  FirebaseFirestore.instance
                                                  .collection('clients')
                                                  .doc(userId?.uid)
                                                  .update({'Adresse' : _nameController.text})
                                                  .then((value) => Navigator.pop(context));
                                                },
                                              ),
                                            ],
                                          );
                                        }
                                      );
                                    },
                                    icon: Icon(Icons.edit),
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
