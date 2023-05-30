import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:welapp/cllient/der/multi2.dart';
import 'package:welapp/cllient/mon_compte.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        //padding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Les dérangement qui sélectionné',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Expanded(
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
                      return Container(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            return Card(
                              margin: const EdgeInsets.all(1),
                                elevation: 20,
                                child: ListTile(
                                  title: Text(snapshot.data!.docs[index]['der'],style:TextStyle(color: Colors.black) ,),
                                  trailing: Icon(Icons.check),
                                )
                            );
                          }
                        ),
                      );
                    }
                    return Container();
                  }
                  
                ),
              ),
              ElevatedButton(
                onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyListView1()));
                },
                child: Text('Sélectionner un dérangement'),
              ),
            ],
          ),
        )
      ),
    );
  }

  



  







  // User? userId = FirebaseAuth.instance.currentUser;
  // String _monTexte = "";
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // bool? _isChecked = false; 
  // bool? _showText = false;
  // TextEditingController _textController = TextEditingController();
  // final now = DateTime.now();

  // late User signedInUser;

  // //   @override
  // // void dispose() {
  // //   _textController.dispose();
  // //   super.dispose();
  // // }
  // List<String> _derangements = [
  //   "Ma ligne n'est pas active",
  //   "Deconnexion d'interne",
  //   'Internet est tree faible',
  //   'Problemes de configuration',
  //   "J'ai deja paie cette facture",
  //   "Ma ligne n'pas active",
  //   //"Autre",
  // ]; // Liste des options disponibles

  // List<String> _selectedOptions = []; // Liste des options sélectionnées

  // // Récupère les options depuis Firestore
  // Future<void> _getOptions() async {
  //   String uid = _auth.currentUser!.uid;
  //   QuerySnapshot querySnapshot =
  //       await _firestore.collection("clients").doc(uid).collection("Derangements").get();
  //   List<String> options = [];
  //   querySnapshot.docs.forEach((doc) {
  //     options.add(doc.id);
  //   });
  //   setState(() {
  //     _derangements = options;
  //   });
  // }


  // // Enregistre les options sélectionnées dans Firestore
  // Future<void> _saveSelectedOptions() async {
  //   String uid = _auth.currentUser!.uid;
  //   //var nom = _firestore.collection("clients").doc(uid).get().then((doc) => 'Nom');
  //   final CollectionReference usersCollection = FirebaseFirestore.instance.collection('clients');

  //   DocumentSnapshot userDoc = await usersCollection.doc(uid).get();
  //   final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  //   Object username = userDoc.data()!;

  //   for (String option in _selectedOptions) {

  //     await _firestore
  //         .collection("derangements")
  //         .doc()
  //         // .collection("Derangements")
  //         // .doc(option)
  //         .set({
  //           "der":option,
  //           "Nom" : username,
  //           "date" : formattedDate,
  //           "resolue" : false,
  //            //"Email" : signedInUser,
  //         });
  //         //"selected": true
  //   }
  // }

  // // void getData() async {
  // //   final mssgs = await _firestore.collection('clients').get();
  // //   for(var mssg in mssgs.docs) {
  // //     print(mssg.data());
  // //   }
  // // }

  // void mssgStreams() async {
  //   await for (var snapshot in _firestore.collection('clients').snapshots()) {
  //     for (var m in snapshot.docs) {
  //       //print(m.data());
  //       final mt = m.get('Nom');
  //       Text('$mt');
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   //_getOptions();
  //   super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     //resizeToAvoidBottomInset: false,
  //     body: Stack(
  //       children: [
  //         Positioned(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               //SizedBox(height: 20,),
  //               Container(
  //                 height: 200,
  //                 decoration: const BoxDecoration(
  //                   color: Color.fromARGB(255, 107, 189, 227),
  //                   borderRadius: BorderRadius.only(
  //                     //bottomLeft: Radius.circular(80)
  //                   ),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(20.0),
  //                   child: Column(
  //                     children: [     
  //                       AppBar(
  //                         backgroundColor: Colors.transparent,
  //                         elevation: 0.0,
  //                         leading: IconButton(
  //                           icon: const Icon(
  //                             Icons.arrow_back_ios,
  //                             size: 30,
  //                           ),
  //                           onPressed: () {
  //                             //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EspacePage()));
  //                           },
  //                         ),
  //                         //////////////
  //                         actions: <Widget>[
                          
  //                           IconButton(
  //                             onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MonCompteCl()));},
  //                             //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MonCompteCl()));},
  //                             icon: const Icon(Icons.person),iconSize: 30,
  //                           ),
  //                             ///////////
  //                           // IconButton(
  //                           //   onPressed: () {
  //                           //     // ScaffoldMessenger.of(context).showSnackBar(
  //                           //     // const SnackBar(content: Text('This is a snackbar')));
  //                           //   },
  //                           //   icon: const Icon(
  //                           //     Icons.message,
  //                           //   ),
  //                           //   iconSize: 30,
  //                           //   tooltip: 'Show Snackbar',
  //                           // ),
                          
  //                         ],
  //                       ),
  //                       Column(
  //                         children: [
  //                           const Text(
  //                             'Sélectionné votre dérangement :',//+user.email!,
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 30,
  //                               fontFamily: 'Inspiration',
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ]
  //                   ),
  //                 ),
  //               )                
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(top: 190),
  //             child: Container(
  //               child: Column(
  //                 children: [
  //                   Expanded(
  //                     child: ListView.builder(  
  //                       itemCount: _derangements.length,
  //                       itemBuilder: (BuildContext context, int index) {
  //                         String option = _derangements[index];
  //                         bool selected = _selectedOptions.contains(option);
  //                         return ListTile(
  //                           title: Text(option),
  //                             trailing: Checkbox(
  //                               value: selected,
  //                               onChanged: (value){
  //                                 setState(() {
  //                                   if (value != null) {
  //                                     _selectedOptions.add(option);
  //                                   } else {
  //                                     _selectedOptions.remove(option);
  //                                   }
  //                                 });
  //                               },
  //                             ),
  //                             onTap: () {
  //                               setState(() {
  //                                 if (selected) {
  //                                   _selectedOptions.remove(option);
  //                                 } else {
  //                                   _selectedOptions.add(option);
  //                                 }
  //                               });
  //                             },
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                   CheckboxListTile(
  //                     title: Text('Autre'),
  //                     value: _isChecked,
  //                     onChanged: (bool? value) {
  //                       setState(() {
  //                         _isChecked = value;
  //                         _showText = value;
  //                       });
  //                     },
  //                   ),
  //                   if (_showText!) Padding(
  //                     padding: const EdgeInsets.only(bottom:65),
  //                     child: TextFormField(
  //                       controller: _textController,
  //                       decoration: InputDecoration(
  //                         labelText: 'Quelque chose à écrire ?',
  //                         border: OutlineInputBorder(),
  //                       ),
  //                       onChanged: (value) {
  //                         _monTexte = value;
  //                       },
  //                       validator: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Veuillez entrer quelque chose';
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //         ),
          

            
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.send),
  //        onPressed: () async {
  //          await _saveSelectedOptions();
  //          _sauvegarderDonnees();
  //          Navigator.pop(context);
  //        },
  //       // onPressed: () {
  //       //   mssgStreams();
  //       // },
  //     ),

  //   );
  // }
  // Future<void> _sauvegarderDonnees() async {
  //   String texteSaisie = _textController.text;
  //   String uid = _auth.currentUser!.uid;
  //   // Stocker les données dans Firestore
  //   // FirebaseFirestore.instance.collection('monCollection').doc().set({
  //   //   'texte': texteSaisi,
  //   // });
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   //CollectionReference users = firestore.collection('clients').doc(uid).snapshots() as CollectionReference<Object?>;
  //   //QuerySnapshot querySnapshot = await users.get();
  //   //var idd = users.get('ID' as GetOptions?);
  //   // QuerySnapshot snapshot =
  //   //     (await FirebaseFirestore.instance.collection('clients').doc(uid).get()) as QuerySnapshot<Object?>;
    
  //   final CollectionReference usersCollection = FirebaseFirestore.instance.collection('clients');

  //   DocumentSnapshot userDoc = await usersCollection.doc(uid).get();

  //   Object username = userDoc.data()!;
  //   final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);


  //   FirebaseFirestore.instance
  //   .collection("derangements")
  //         .doc()
  //         //.collection("Derangements")
  //         //.doc(texteSaisie)
  //         .set({
  //          // if(texteSaisie){
  //           "der": texteSaisie,
  //           "Nom" : username,
  //           "date" : formattedDate,
  //           "resolue" : false,
  //           //},
  //          //"ID" : users.get('ID' as GetOptions?),
  //         }
  //        );

  // }
}
