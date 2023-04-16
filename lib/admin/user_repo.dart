import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:welapp/admin/user.dart';
import 'package:welapp/admin/user.dart';

import '../admin/user.dart';
import 'user.dart';

Future addUser(Utilisateur user) async {
  final docUser = FirebaseFirestore.instance.collection('clients').doc();
  user.id = docUser.id;
  await docUser.set(user.toJson());
}


