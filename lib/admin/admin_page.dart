//import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/admin/d_box.dart';
import 'package:welapp/admin/editeUsers.dart';
import 'package:welapp/admin/user.dart';
import 'package:welapp/login.dart';

class AdminPage extends StatefulWidget {

  const AdminPage({super.key,});

  
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Utilisateur> userList = [];
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('clients').snapshots();
  //AuthServices _ath = AuthServices();
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
                  padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 50),
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
                            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  LoginPage(),
            ),
          );
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
          StreamBuilder(
            stream: _usersStream,
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasError) {
                return const Text('something is wrong');
              }
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 230),
                child: Container(
                  height: 600,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>EditeUsers(docid: snapshot.data!.docs[index],)));
                        },
                        child: Card(
                          margin: const EdgeInsets.all(4),
                          elevation: 8,
                          child: ListTile(
                            leading: Icon(Icons.person,size: 40,),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            //   side: BorderSide(
                            //     color: Colors.black,
                            //   ),
                            // ),
                            title: Row(
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['CNI'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  snapshot.data!.docChanges[index].doc['Nom'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black54),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  snapshot.data!.docChanges[index].doc['Prenom'],
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black54),
                                ),
                              ],
                            ),
                            //econtentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
            },
          ),
        ],
      ),
    );
  }

}