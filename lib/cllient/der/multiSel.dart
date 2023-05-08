import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  String _monTexte = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool? _isChecked = false; 
  bool? _showText = false;
  TextEditingController _textController = TextEditingController();
    @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  List<String> _derangements = [
    "Ma ligne n'est pas active",
    "Deconnexion d'interne",
    'Internet est tree faible',
    'Problemes de configuration',
    "J'ai deja paie cette facture",
    "Ma ligne n'pas active",
    //"Autre",
  ]; // Liste des options disponibles

  List<String> _selectedOptions = []; // Liste des options sélectionnées

  // Récupère les options depuis Firestore
  Future<void> _getOptions() async {
    String uid = _auth.currentUser!.uid;
    QuerySnapshot querySnapshot =
        await _firestore.collection("clients").doc(uid).collection("Derangements").get();
    List<String> options = [];
    querySnapshot.docs.forEach((doc) {
      options.add(doc.id);
    });
    setState(() {
      _derangements = options;
    });
  }

  // Enregistre les options sélectionnées dans Firestore
  Future<void> _saveSelectedOptions() async {
    String uid = _auth.currentUser!.uid;
    for (String option in _selectedOptions) {
      await _firestore
          .collection("clients")
          .doc(uid)
          .collection("Derangements")
          .doc(option)
          .set({"selected": true});
    }
  }

  @override
  void initState() {
    //_getOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EspacePage()));
                          },
                        ),
                        //////////////
                        actions: <Widget>[
                          
                          IconButton(
                            onPressed: () {},
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MonCompteCl()));},
                             icon: const Icon(Icons.person),iconSize: 30,),
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
                          const Text(
                            'Hi ,',//+user.email!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Inspiration',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            //user.email!,
                            '',
                            style: const TextStyle(
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
          padding: const EdgeInsets.only(top: 180),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(  
                           itemCount: _derangements.length,
                           itemBuilder: (BuildContext context, int index) {
                              String option = _derangements[index];
                              bool selected = _selectedOptions.contains(option);
                              return ListTile(
                                 title: Text(option),
                                 trailing: Checkbox(
                                  value: selected,
                                  onChanged: (value){
                                    setState(() {
                                      if (value != null) {
                                        _selectedOptions.add(option);
                                        } else {
                                          _selectedOptions.remove(option);
                                        }
                                        });
                                  },
                                 ),
                                 onTap: () {
                            setState(() {
                               if (selected) {
                               _selectedOptions.remove(option);
                               } else {
                                 _selectedOptions.add(option);
                               }
                            });
                           },
                              );
                           },
                  ),
                ),
                          CheckboxListTile(
          title: Text('Autre'),
                 value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                   _isChecked = value;
                    _showText = value;
                  });
                },
                ),
                               if (_showText!) Padding(
                                              padding: const EdgeInsets.only(bottom:65),
                                              child: TextFormField(
                                                controller: _textController,
                                                decoration: InputDecoration(
                                                labelText: 'Quelque chose à écrire ?',
                                                border: OutlineInputBorder(),
                                                ),
                                              onChanged: (value) {
                                                _monTexte = value;
                                            },
                                              validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Veuillez entrer quelque chose';
                                              }
                                              return null;
                                              },
                                                         ),)
              ],
            ),
          ),
          

            
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
         onPressed: () async {
           await _saveSelectedOptions();
           _sauvegarderDonnees();
           Navigator.pop(context);
         },
      ),

      // appBar: AppBar(
      //   title: Text("Sélectionnez des options"),
      // ),
      // body: SafeArea(
      //   child: Container(
      //     child: Column(
      //       children: [
      //         Expanded(
      //           child: _derangements.isEmpty
      //               ? Center(
      //                   child: CircularProgressIndicator(),
      //                 )
      //               : ListView.builder(
      //                   itemCount: _derangements.length,
      //                   itemBuilder: (BuildContext context, int index) {
      //                     String option = _derangements[index];
      //                     bool selected = _selectedOptions.contains(option);
      //                     return ListTile(
      //                       title: Text(option),
      //                       trailing: Checkbox(
      //                         value: selected,
      //                         onChanged: (value) {
      //                           setState(() {
      //                             if (value != null) {
      //                               _selectedOptions.add(option);
      //                             } else {
      //                               _selectedOptions.remove(option);
      //                             }
      //               //               if (value == true && _derangements[index] == 'Autre') {
      //               //   // Ajouter ici la condition pour nom1
      //               // }
      //                           });
      //                         },
      //                       ),
      //                       onTap: () {
      //                         setState(() {
      //                           if (selected) {
      //                             _selectedOptions.remove(option);
      //                           } else {
      //                             _selectedOptions.add(option);
      //                           }
      //                         });
      //                       },
      //                     );
      //                   },
      //                 ),
                      
                      
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(bottom:10),
      //           child: CheckboxListTile(
      //           title: Text('Autre'),
      //           value: _isChecked,
      //           onChanged: (bool? value) {
      //             setState(() {
      //               _isChecked = value;
      //               _showText = value;
      //             });
      //           },
      //           ),
      //         ),
      //         if (_showText!) Padding(
      //           padding: const EdgeInsets.only(bottom:100),
      //           child: TextFormField(
      //             controller: _textController,
      //             decoration: InputDecoration(
      //             labelText: 'Quelque chose à écrire ?',
      //             border: OutlineInputBorder(),
      //             ),
      //           onChanged: (value) {
      //             _monTexte = value;
      //           },
      //           validator: (value) {
      //           if (value!.isEmpty) {
      //             return 'Veuillez entrer quelque chose';
      //           }
      //           return null;
      //           },
      //                      ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.send),
      //   onPressed: () async {
      //     await _saveSelectedOptions();
      //     _sauvegarderDonnees();
      //     Navigator.pop(context);
      //   },
      // ),
    );
  }
  void _sauvegarderDonnees() {
    String texteSaisie = _textController.text;
    String uid = _auth.currentUser!.uid;
    // Stocker les données dans Firestore
    // FirebaseFirestore.instance.collection('monCollection').doc().set({
    //   'texte': texteSaisi,
    // });
    FirebaseFirestore.instance
    .collection("clients")
          .doc(uid)
          .collection("Derangements")
          .doc(texteSaisie)
          .set({"selected": true});

  }
}
