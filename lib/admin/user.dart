import 'package:flutter/material.dart';

class Utilisateur{
  final String nom;
  final String prenom;
  final String cni;
  final String email;
  final String phoneNo;
  final String ville;
  final String adresse;

  

  Utilisateur(this.nom,this.email,this.phoneNo,this.prenom,this.ville,this.cni,this.adresse);
}