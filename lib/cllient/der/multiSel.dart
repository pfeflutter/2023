import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool? _isChecked = false; 
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
    "Autre",
  ]; // Liste des options disponibles

  List<String> _selectedOptions = []; // Liste des options sélectionnées

  // Récupère les options depuis Firestore
  Future<void> _getOptions() async {
    String uid = _auth.currentUser!.uid;
    QuerySnapshot querySnapshot =
        await _firestore.collection("users").doc(uid).collection("options").get();
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
      appBar: AppBar(
        title: Text("Sélectionnez des options"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: _derangements.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: _derangements.length,
                        itemBuilder: (BuildContext context, int index) {
                          String option = _derangements[index];
                          bool selected = _selectedOptions.contains(option);
                          return ListTile(
                            title: Text(option),
                            trailing: Checkbox(
                              value: selected,
                              onChanged: (value) {
                                setState(() {
                                  if (value != null) {
                                    _selectedOptions.add(option);
                                  } else {
                                    _selectedOptions.remove(option);
                                  }
                    //               if (value == true && _derangements[index] == 'Autre') {
                    //   // Ajouter ici la condition pour nom1
                    // }
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
              Padding(
                padding: const EdgeInsets.only(bottom:0),
                // child: CheckboxListTile(
                // title: Text('Autre'),
                // value: _isChecked,
                // onChanged: (bool? value) {
                //   setState(() {
                //     _isChecked = value;
                //   });
                // },
                // ),
              ),
              if (_isChecked! == _derangements.contains("Autre")) Padding(
                padding: const EdgeInsets.only(bottom:100),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                  labelText: 'Quelque chose à écrire ?',
                  border: OutlineInputBorder(),
                  ),
                
                // validator: (value) {
                // if (value!.isEmpty) {
                //   return 'Veuillez entrer quelque chose';
                // }
                // return null;
                // },
                           ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () async {
          await _saveSelectedOptions();
          Navigator.pop(context);
        },
      ),
    );
  }
}
