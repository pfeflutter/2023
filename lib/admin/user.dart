import 'package:flutter/material.dart';

class Utilisateur{
  final String nom;
  final String prenom;
  final String cni;
  final String email;
  final String phoneNo;
  final String ville;
  final String adresse;
  String id;
  
  

  Utilisateur({
    this.id = '',
   required this.nom,
    required this.email,required this.phoneNo,required this.prenom,required this.ville,required this.cni,required this.adresse,
});
}