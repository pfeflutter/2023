// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'c_client.dart';
// import 'child_list.dart';
// import 'compte.dart';

// class Myhome extends StatefulWidget {
//   const Myhome({Key? key}) : super(key: key);

//   @override
//   State<Myhome> createState() => _MyhomeState();
// }

// class _MyhomeState extends State<Myhome> {
//   List<Task> tasks = [];

//   @override
//   Widget build(BuildContext context) {
//     var time = DateTime.now();

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           // showModalBottomSheet(
//           //   isScrollControlled: true,
//           //   context: context,
//           //   builder: (context) => Compte()
//           //   );
//             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Compte((newTaskTitle){
//               setState(() {
//                 tasks.add(Task(name: newTaskTitle));
//                 Navigator.pop(context);
//               });
//             })));           
//         },
//         //backgroundColor: Colors.blue[400],
//         child: const Icon(Icons.add),
//       ),
//       backgroundColor: Colors.blue[800],
//       body: SafeArea(
//         //padding: EdgeInsets.only(top: 60,left: 20,right: 20,bottom: 80,),
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Icon(
//                         Icons.playlist_add_check,
//                         size: 40,
//                         color: Colors.white,
//                       ),
//                       //SizedBox(width: 20),
                      
//                       Column(
//                         //crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Hi Admin',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 35,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Inspiration',
//                             ),
//                           ),
//                           const SizedBox(height: 8,),
//                           //Time
//                           Text(
//                             '${time.year}-${time.month}-${time.day}',
//                             style: TextStyle(
//                               color: Colors.blue[200],
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             '${time.hour}:${time.minute}:${time.second}',
//                             style: TextStyle(
//                               color: Colors.blue[200],
//                               fontSize: 17,
//                             ),
//                           ),
//                           ////////////////////
//                         ],
//                       ),
//                       //Sign out
//                       Container(
//                         child: IconButton(
//                           onPressed: () {
//                             //Navigator.pop(context);
//                             FirebaseAuth.instance.signOut();
//                           },
//                           icon: const Icon(
//                             Icons.exit_to_app,
//                             size: 30,
//                           ),
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 25,),
//                   //search bar ////////////////
//                   //SingleChildScrollView(
//                      Container(
//                       decoration: BoxDecoration(
//                         color: Colors.blue[600],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 15),
//                         child: TextField(
//                           //onChanged: (value) => _runFilter(value),
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             icon: Icon(Icons.search,color: Colors.white,),
//                             hintText: 'Search',
//                             hintStyle: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   //),
//                 ],
//               ),
//             ),
//             Text(
//               '${tasks.length} Client',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//             SizedBox(height: 20,),


//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(12),
//                 color: Colors.grey[100],
//                 child: TasksListe(tasks),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }