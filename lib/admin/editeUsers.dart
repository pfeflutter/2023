import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/admin/admin_page.dart';

class EditeUsers extends StatefulWidget {
  DocumentSnapshot docid;
  EditeUsers({required this.docid});

  @override
  State<EditeUsers> createState() => _EditeUsersState();
}

class _EditeUsersState extends State<EditeUsers> {
  final _auth = FirebaseAuth.instance;

  var  nomController = TextEditingController();
  var prenomController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNoController = TextEditingController();
  var villeController = TextEditingController();
  var cniController = TextEditingController();
  var adresseController = TextEditingController();
  //var typeLController = TextEditingController();

  void initState(){
    nomController = TextEditingController(text: widget.docid.get('Nom'));
    prenomController = TextEditingController(text: widget.docid.get('Prenom'));
    adresseController = TextEditingController(text: widget.docid.get('Adresse'));
    cniController = TextEditingController(text: widget.docid.get('CNI'));
    emailController = TextEditingController(text: widget.docid.get('Email'));
    phoneNoController = TextEditingController(text: widget.docid.get('Phone'));
    villeController = TextEditingController(text: widget.docid.get('Ville'));
    //typeLController = TextEditingController(text: widget.docid.get('Type Ligne'));
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
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: (){
              _auth.createUserWithEmailAndPassword(email: emailController.text, password: cniController.text);
              widget.docid.reference.update({
                    'updatedAt': FieldValue.serverTimestamp(),
                    'Nom' : nomController.text,
                    'Prenom' : prenomController.text,
                    'CNI' : cniController.text,
                    'Email' : emailController.text,
                    'Phone' : phoneNoController.text,
                    'Ville' : villeController.text,
                    'Adresse' : adresseController.text,
              }).whenComplete(() {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> AdminPage()));
              });
            },
            child: Text("Save"),
          ),
          MaterialButton(
            onPressed: (){
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AdminPage()));
              });
            },
            child: Text('Delete'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: [
                buildTextfield('Nom',nomController),
                buildTextfield('Prenom',prenomController),
                buildTextfield('Email',emailController),
                buildTextfield('Phone',phoneNoController),
                buildTextfield('CNI',cniController),
                buildTextfield('Ville',villeController),
                buildTextfield('Adresse',adresseController),
                //buildTextfield('Adresse',typeLController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



