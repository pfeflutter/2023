import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welapp/admin/admin_page.dart';
import 'package:welapp/agent/agent_page.dart';

class DerUsers extends StatefulWidget {
  DocumentSnapshot docid;
  DerUsers({required this.docid});

  @override
  State<DerUsers> createState() => _DerUsersState();
}

class _DerUsersState extends State<DerUsers> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    bool? _isChecked = false; 
  bool? _showText = false;


  List<String> _derangements = [
    "Ma ligne n'est pas active",
    "Deconnexion d'interne",
    'Internet est tree faible',
    'Problemes de configuration',
    "J'ai deja paie cette facture",
    "Ma ligne n'pas active",
    //"Autre",
  ];
  List<String> _selectedOptions = []; 

  var  nomController = TextEditingController();
  var prenomController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNoController = TextEditingController();
  var villeController = TextEditingController();
  var cniController = TextEditingController();
  var adresseController = TextEditingController();
  
  get user => null;


  // Enregistre les options sélectionnées dans Firestore
  // Future<void> _saveSelectedOptions() async {
  //   String uid = _auth.currentUser!.uid;
  //   for (String option in _selectedOptions) {
  //     await _firestore
  //         .collection("clients")
  //         .doc(uid)
  //         .collection("Derangements")
  //         .doc(option)
  //         .set({"selected": true});
  //   }
  // }
  
    // Récupère les options depuis Firestore
  Future<void> _getOptions() async {
    String uid = _auth.currentUser!.uid;
    QuerySnapshot querySnapshot =
        await _firestore.collection("clients").doc(widget.docid as String?).collection("Derangements").get();
        //doc(user!.uid).collection("Derangements").get();
    List<String> options = [];
    querySnapshot.docs.forEach((doc) {
      options.add(doc.id);
    });
    setState(() {
      _derangements = options;
    });
  }
  @override
  void initState() {
    // nomController = TextEditingController(text: widget.docid.get('Nom'));
    // prenomController = TextEditingController(text: widget.docid.get('Prenom'));
    // adresseController = TextEditingController(text: widget.docid.get('Adresse'));
    // cniController = TextEditingController(text: widget.docid.get('CNI'));
    // emailController = TextEditingController(text: widget.docid.get('Email'));
    // phoneNoController = TextEditingController(text: widget.docid.get('Phone'));
    villeController = TextEditingController(text:  widget.docid.get('Ville'));
    //_getOptions();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    Widget buildTextfield(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            )
          ),
          controller: controller,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: [
                // buildTextfield('Nom',nomController),
                // buildTextfield('Prenom',prenomController),
                // buildTextfield('Email',emailController),
                // buildTextfield('Phone',phoneNoController),
                // buildTextfield('CNI',cniController),
                 buildTextfield('Ville',villeController),
                // buildTextfield('Adresse',adresseController),
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //         .collection("clients")
                //         .doc()
                //         .collection("Derangements").get(),
                //   builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                //     if(snapshot.hasError){
                //    return Text("Something went wrong!");
                //  }
                //  if(snapshot.connectionState == ConnectionState.waiting){
                //    return  Center(
                //      child: CupertinoActivityIndicator(),
                //    );
                //  }
                //  if(snapshot.data!.docs.isEmpty){
                //    return Text('No Data Found!');
                //  }
                //  if(snapshot != null && snapshot.data != null){
                //   return Expanded(
                //     child: ListView.builder(
                //       itemCount: snapshot.data!.docs.length,
                //       itemBuilder: (context,index){
                //         return Card(
                //           child: Column(
                //             children: [
                              
                //             ],
                //           ),
                //         );
                //       }
                //     ),
                //   );
                //  }
                //   }
                // ),
              ],
            ),
          ),
        ),
      ),

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
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.send),
      //   onPressed: () async {
      //     await _saveSelectedOptions();
      //     //_sauvegarderDonnees();
      //     Navigator.pop(context);
      //   },
      // ),
    );
  }
    
  }




