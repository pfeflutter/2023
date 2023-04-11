import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:welapp/admin/user.dart';
import 'package:welapp/admin/admin_page.dart';
import 'package:welapp/main.dart';

class AddUserDialog extends StatefulWidget {
  //const AddUsersDialog({super.key});
  final Function(Utilisateur) addUser;
  AddUserDialog(this.addUser);
  
  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  CollectionReference ref = FirebaseFirestore.instance.collection('clients').doc() as CollectionReference<Object?>;
  //final _db = FirebaseFirestore.instance;
  //late DatabaseReference dbRef;
  final _auth = FirebaseAuth.instance;

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final villeController = TextEditingController();
  final cniController = TextEditingController();
  final adresseController = TextEditingController();

   
    // void initState() {
    //   super.initState();
    //   dbRef = FirebaseDatabase.instance.ref().child('Clients');
    // }

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



    return Container(
      padding: EdgeInsets.all(8),
      height: 450,
      //width: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Add User',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
            buildTextfield('Nom',nomController),
            buildTextfield('om',prenomController),
            buildTextfield('Email',emailController),
            buildTextfield('Phone',phoneNoController),
            buildTextfield('CNI',cniController),
            buildTextfield('Ville',villeController),
            buildTextfield('Adresse',adresseController),
            


            ElevatedButton(
              onPressed: (){
                final userr = Utilisateur(nom: nomController.text, email: emailController.text, phoneNo: phoneNoController.text, prenom: prenomController.text, cni: cniController.text,ville: villeController.text, adresse: adresseController.text,);
                widget.addUser(userr);
                _auth.createUserWithEmailAndPassword(email: emailController.text, password: cniController.text);
                ref.add({
                    'Nom' : nomController.text,
                    'Prenom' : prenomController.text,
                    'CNI' : cniController.text,
                    'Email' : emailController.text,
                    'Phone' : phoneNoController.text,
                    'Ville' : villeController.text,
                    'Adresse' : adresseController.text,
                    //'ID' : ref.id,
                }).whenComplete(() {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AdminPage()));
                });
                //Navigator.of(context).pop();
              },
              child: Text('Add User')),
      
          ],
        ),
      ),
    );
  }
}