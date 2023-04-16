import 'package:flutter/material.dart';

class Utilisateur{
  String nom;
  String prenom;
  String cni;
  String email;
  String phoneNo;
  String ville;
  String adresse;
  String id;
  
  

  Utilisateur({
    this.id = 'result.user.uid',
   required this.nom,
    required this.email,required this.phoneNo,required this.prenom,required this.ville,required this.cni,required this.adresse,
});
  

  Map<String,dynamic> toJson() {
    return {
      'id' : id,
                    'Nom' : nom,
                    'Prenom' : prenom,
                    'CNI' : cni,
                    'Email' : email,
                    'Phone' : phoneNo,
                    'Ville' : ville,
                    'Adresse' : adresse,
    };
  }
  
  factory Utilisateur.fromJson(Map<String,dynamic> json) {
    return Utilisateur(id: json['id'], nom: json['nom'], email: json['email'], phoneNo: json['phoneNo'], prenom: json['prenom'], ville: json['ville'], cni: json['cni'], adresse: json['adresse']);
  }
}

