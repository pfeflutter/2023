// 
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
  //final ref = FirebaseFirestore.instance.collection('clients').doc('rsl6cYTtUiexo9JsvAg4BQgvpTR2');
  //final _db = FirebaseFirestore.instance;
  //late DatabaseReference dbRef;
 /// var _auth = FirebaseAuth.instance;

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final villeController = TextEditingController();
  final cniController = TextEditingController();
  final adresseController = TextEditingController();
   // User? currentUser = FirebaseAuth.instance.currentUser;
   
    // void initState() {
    //   super.initState();
    //   dbRef = FirebaseDatabase.instance.ref().child('Clients');
    // }

  List<String> _colors = ['Internet ADSL', 'Fibre optique', 'Internet satellite','Internet 4G'];
  String _selectedLigne = 'Internet 4G';
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
            ),
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
            buildTextfield('Prenom',prenomController),
            buildTextfield('Email',emailController),
            buildTextfield('Phone',phoneNoController),
            buildTextfield('CNI',cniController),
            buildTextfield('Ville',villeController),
            buildTextfield('Adresse',adresseController),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                padding: EdgeInsets.only(left: 6,right: 0),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.grey,width: 1),
                //   borderRadius: BorderRadius.circular(4),
                // ),
                child: DropdownButton(
                  value: _selectedLigne,
                  //hint: Text('Type Ligne'),
                  //dropdownColor: Colors.white,
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _selectedLigne = value!;
                    });
                  },
                  items: _colors.map((color) {
                    return DropdownMenuItem(
                      value: color,
                      child: Text(color),
                    );
                  }).toList(),
              
                ),
              ),
            ),


           ElevatedButton(
               onPressed: ()async {
                // final userr = Utilisateur(nom: nomController.text, email: emailController.text, phoneNo: phoneNoController.text,
                //  prenom: prenomController.text, cni: cniController.text,ville: villeController.text, adresse: adresseController.text,);
                // widget.addUser(userr);
                
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: cniController.text)
                  .then((value) {
                    FirebaseFirestore.instance
                    .collection('clients').doc(value.user!.uid).set({
                    'CreatedAt': FieldValue.serverTimestamp(),
                    'Nom' : nomController.text,
                    'Prenom' : prenomController.text,
                    'CNI' : cniController.text,
                    'Email' : emailController.text,
                    'Phone' : phoneNoController.text,
                    'Ville' : villeController.text,
                    'Adresse' : adresseController.text,
                    'ID' : value.user!.uid,
                    'Type Ligne': _selectedLigne,
                }).whenComplete(() {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AdminPage()));
                   print('error');
                });
                //Navigator.of(context).pop();
              });},
              child: Text('Add User')),
      
          ],
        ),
      ),
    );
  }
}