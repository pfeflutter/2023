import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'contact.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  List<Contact> contacts = List.empty(growable: true);
  List todos = [];
  String inputTodo = "";
  createTodos() {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyTodos").doc(inputTodo);
    Map<String,String> todos = {
      "todoTitle" : inputTodo,
    };
    // ignore: avoid_print
    documentReference.set(todos).whenComplete(() => print("$inputTodo created"));
  }
  deleteTodos() {}

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewCl()));
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // body: Stack(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Positioned(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             //SizedBox(height: 20,),
      //             Container(
      //               height: 200,
      //               decoration: const BoxDecoration(
      //                 color: Color.fromARGB(255, 107, 189, 227),
      //                 borderRadius: BorderRadius.only(
      //                   //bottomLeft: Radius.circular(80)
      //                 ),
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(20.0),
      //                 child: Column(
      //                   children: [
                          
      //                   AppBar(
      //                     backgroundColor: Colors.transparent,
      //                     elevation: 0.0,
      //                     leading: IconButton(
                            
      //                       icon: const Icon(
      //                         Icons.arrow_back_ios,
      //                         size: 30,
      //                       ),
      //                       onPressed: () {
      //                         Navigator.pop(context);
      //                       },
      //                     ),
      //                     //////////////
      //                     actions: <Widget>[
                            
      //                       IconButton(
      //                         onPressed: () {}, icon: const Icon(Icons.person),iconSize: 30,),
      //                       ///////////
      //                       IconButton(
      //                         onPressed: () {
      //                           // ScaffoldMessenger.of(context).showSnackBar(
      //                           // const SnackBar(content: Text('This is a snackbar')));
      //                         },
      //                         icon: const Icon(
      //                           Icons.notifications_active,
      //                         ),
      //                         iconSize: 30,
      //                         tooltip: 'Show Snackbar',
      //                       ),
                            
      //                     ],
      //                   ),
      //                   Column(
      //                     children: const [
      //                       Text(
      //                         'Espace Agent',
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                           fontSize: 30,
      //                           fontFamily: 'Inspiration',
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   ]
      //                 ),
      //               ),
      //             ) 
                 
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 500),
      //     contacts.isEmpty ? Text('No Contact.........',style: TextStyle(fontSize: 40,color: Colors.black),):
      //     Expanded(
      //       child: ListView.builder(
      //         itemBuilder: (context,index) => getRow(index),
      //         itemCount: contacts.length,
      //       ),
      //     ),
      //   ]
      // ),
      appBar: AppBar(
        title: const Text('TodoList'),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: const Text('Add todo'),
                  content: TextField(
                    onChanged: (String value) {
                      inputTodo = value;
                    },
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todos.add(inputTodo);
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    )
                  ],
                );
              }
            );
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: todos.length, //snapshot.data?.docs.length,
              itemBuilder: (BuildContext context,int index) {
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  
                ),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          },
        );
          },
        )
       
      
    );
  }


  Widget getRow(int index) {
      return ListTile(
        title: Column(
          children: [
            Text(contacts[index].nom),
            Text(contacts[index].prenom),
          ],
        ),
      );
  }
}