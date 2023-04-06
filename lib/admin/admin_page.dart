//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:welapp/admin/d_box.dart';
import 'package:welapp/admin/user.dart';
import 'package:welapp/cllient/mon_compte.dart';

class AdminPage extends StatefulWidget {
  //final CompteClient cClient;
  const AdminPage({super.key,});
  //final String title;
  
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  //Query _ref;
  // DatabaseReference reference = FirebaseDatabase.instance.reference().child('Contacts');
  // @override
  // void initState() {
  //   super.initState();
  //   _ref = FirebaseDatabase.instance.reference().child('Clients').orderByChild('Nom');
  // }
  
  List<Utilisateur> userList = [];
  

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();

    void addUserData(Utilisateur user){
      setState(() {
        userList.add(user);
      });
    }

    
    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddUserDialog(addUserData),
        );
      },);
    }
    



    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        // () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddUsersDialog()));},
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.blue[800],
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 40),
                  //padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {Navigator.pop(context);},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                            ),
                            color: Colors.white,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hi Admin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inspiration',
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              //Time
                              Text(
                                '${time.year}-${time.month}-${time.day}',
                                style: TextStyle(
                                  color: Colors.blue[200],
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '${time.hour}:${time.minute}:${time.second}',
                                style: TextStyle(
                          color: Colors.blue[200],
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
            
                  // // Notification
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue[600],
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   padding: const EdgeInsets.all(16),
                  //   child: const Icon(
                  //     Icons.notifications,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  //sign out
                  Container(
                        child: IconButton(
                          onPressed: () {
                            //Navigator.pop(context);
                            FirebaseAuth.instance.signOut();
                          },
                          icon: const Icon(
                            Icons.exit_to_app,
                            size: 30,
                          ),
                          color: Colors.white,
                        ),
                      ),
                ],
              ),
              const SizedBox(height: 25,),
              //search bar ////////////////
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    //onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      
                      hintText: 'Search',
                      //hintText: Text(''),
                      
                    ),
                
                  ),
                ),
              ),
              ],
              ),
            ),
          ],
        ),
          ),
          
           // const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(top: 230),
              child: Container(
                height: 600,
                color: Colors.white,
                // }),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(4),
                      elevation: 8,
                      
                      //icon: Icons.abc,
                      // child: ListTile(
                      //   title: Text(userList[index].username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromARGB(255, 86, 18, 146)),),
                      //   subtitle: Text(userList[index].email),
                      //   trailing: Text(userList[index].phoneNo),
                      // ),
                      child: ListTile(
                        title: Row(
                          children: [
                            const Icon(Icons.person,size: 30,),
                            const SizedBox(width: 10),
                            Text(userList[index].ville),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            const SizedBox(width: 35),
                            Text(userList[index].nom),
                            const SizedBox(width: 10),
                            Text(userList[index].prenom),
                          ],
                        ),
                        trailing: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MonCompteCl()));},icon: const Icon(Icons.arrow_circle_right)),
                      ),
                    );
                  },
                  itemCount: userList.length,
                ),
              ),
            )
          
        
        ],
      ),
    );
  }

}