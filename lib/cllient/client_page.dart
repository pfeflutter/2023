//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/cllient/der/multiSel.dart';
import 'package:welapp/cllient/mes_fact.dart';
import 'package:welapp/cllient/mes_lignes.dart';
import 'package:welapp/cllient/mon_compte.dart';
import 'package:welapp/login.dart';



class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final user = FirebaseAuth.instance.currentUser!;

@override
Widget build(BuildContext context){
     return Scaffold(

      body: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 20,),
                Container(
                  height: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 107, 189, 227),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80)
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        leading: IconButton(
                          
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                          ),
                          onPressed: () {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EspacePage()));
                          },
                        ),
                        //////////////
                        actions: <Widget>[
                          
                          IconButton(
                            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MonCompteCl()));}, icon: const Icon(Icons.person),iconSize: 30,),
                          ///////////
                          IconButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              // const SnackBar(content: Text('This is a snackbar')));
                            },
                            icon: const Icon(
                              Icons.message,
                            ),
                            iconSize: 30,
                            tooltip: 'Show Snackbar',
                          ),
                          
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Hi ,',//+user.email!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Inspiration',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user.email!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Inspiration',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        
                          // MaterialButton(
                          //   onPressed: (){
                          //     FirebaseAuth.instance.signOut();
                          //   },
                          //   color: Colors.blue,
                          //   child: Text('sign out'),
                          //   ), 
                          
                          
                        ],
                      ),
                      ]
                    ),
                  ),
              
                  
                ) 
               
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 250),

          child: ListView(
          
          children:[
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20,),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
              ),
              child: ListTile(
                title: const Text(
                  "Mon compte",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                ),
                subtitle: const Text('mes informations',style: TextStyle(color: Colors.white),),
                trailing: const Icon(Icons.arrow_forward_ios),
                leading: const Icon(Icons.account_box_rounded,size: 30,),
                iconColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => const MonCompteCl(),
                      ),
                  );
                },
              ),
            ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            child: ListTile(
              title: const Text("Mes factures",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,),),
              subtitle: const Text('clique ici pur paire',style: TextStyle(color: Colors.white),),
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.text_snippet,size: 30,),
              iconColor: Colors.white,
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MesFactureCl(),
                    ),
                  );
                },
            ),
        ),
        const SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,),
          padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            child: ListTile(
              title: const Text("Les derangement",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              subtitle: const Text('selectionne un derangement',style: TextStyle(color: Colors.white),),
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.question_mark,size: 30,),
              dense: true,
              iconColor: Colors.white,
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyListView(),),);
              },
            ),
        ),
        const SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,),
          padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
            ),
          child: ListTile(
            title: const Text("Mes lignes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
            subtitle: const Text('clique ici pur voire votre lignes',style: TextStyle(color: Colors.white),),
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: const Icon(Icons.call),
            //contentPadding: EdgeInsets.all(20),
            dense: true,
            iconColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                  MaterialPageRoute(
                    builder: (context) => const MesLignesCl(),
                  ),
                );
              },
          ),
        ),
        const SizedBox(height: 20,),
        Column(
          children: [
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  LoginPage(),
            ),
          );
              },
              child: const Text(
                'sign out',
              ),
            ),
         ],
        ),
        const SizedBox(height: 20,)
        ],
      ) ,
    ),
          
         
    ],
      
    ),
  );
}

}

// class CourseCart extends StatelessWidget {
//   const CourseCart({
//     Key ? key, required this.text, required this.icon, required this.color,
//   }) : super(key: key);
//   final String text;
//   final IconData icon;
//   final Color color;
//   //final

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 20,right: 20,),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12), 
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.white,
//             offset: Offset(-5, 5),
//             blurRadius: 20,
//             spreadRadius: 0.5,
//           )
          
//         ]
//       ),

//       child: Column(
//         children: [
//           Container(
//             height: 70,
//             width: 70,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               boxShadow: [
//               BoxShadow(
//                 color: Color.fromARGB(255, 231, 207, 207),
//                 offset: Offset(-5, 5),
//                 blurRadius: 20,
//                 spreadRadius: 0.5,
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(-5, 5),
//                 blurRadius: 0.0,
//                 spreadRadius: 3.0,
//               )
          
//               ]
//             ),
//             child: Padding(
//               padding: const  EdgeInsets.all(10),
//               child: IconButton(onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AdminPage(),
//                     ),
//               );
//               }, icon: Icon(icon),iconSize: 30,),
//               ),
//           ),
//           const SizedBox(height: 20),
//           Column(
//             children:  [
//               GestureDetector(
//                 onTap: () {
                  
//                 },
//               child: Text(
//                 text,
//               ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }