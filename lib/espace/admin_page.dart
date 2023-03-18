import 'dart:ffi';

import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
              //padding: EdgeInsets.all(12),
              child: Column(
                
                children: [
                  //greeting row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inspiration',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '18 MAR, 2023',
                        style: TextStyle(
                          color: Colors.blue[200],
                          //fontSize: 8,
                        ),
                      ),
                    ],
                  ),
            
                  // Notification
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              //search bar 
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ],
              ),
            ),

            SizedBox(height: 25),
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.grey[100],
                child: Center(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exercises',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),









      // //App Bar
      // appBar: AppBar(
      //   title: const Text('client page'),
      //   backgroundColor: Colors.grey,
      
      // //////////
      // actions: <Widget>[
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.person),iconSize: 30,),
      //   ///////////
      //   IconButton(
      //     onPressed: () {
      //       //ScaffoldMessenger.of(context).showSnackBar(
      //           //const SnackBar(content: Text('This is a snackbar')));
      //     },
      //     icon: const Icon(
      //       Icons.notifications_active,
      //     ),
      //     iconSize: 30,
      //     tooltip: 'Show Snackbar',
      //   ),
        
      // ],
      // //////////
      // leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //       size: 30,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ///////////////
      
      // ),

      // body: Container(
      //   padding: const EdgeInsets.symmetric(
      //    // padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
      //     // decoration: BoxDecoration(
      //     //      color: Color(0xFF674AEF),
      //     //      borderRadius: BorderRadius.only(
      //     //        bottomLeft: Radius.circular(20),
      //     //        bottomRight: Radius.circular(0),
      //     //      )
      //     //    ),
      //     //horizontal: 0,
          
      //   ),
      //   child: SingleChildScrollView(
          
      //     child: Center(
      //       child: Column(
      //         //mainAxisAlignment: MainAxisAlignment.center,
      //         //crossAxisAlignment: CrossAxisAlignment.start,
      //         //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [

      //           SizedBox(height: 40,),
      //           Text(
      //             'Espace Admin',
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 30,
      //             ),
      //           ),
      //           ///////////////////
      //           SizedBox(height: 30,),
      //           ////////////////////
      //           GestureDetector(
      //             onTap: (){
      //               //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
      //             },
                  
      //             child: Container(
      //               width: double.infinity,
      //               margin: EdgeInsets.all(15.0),
      //               padding: EdgeInsets.all(10.0),
      //               decoration: BoxDecoration(
      //                 border: Border.all(color: Colors.grey,width: 3),
      //                 borderRadius: BorderRadius.all(Radius.circular(10))
      //                 //border: Border(bottom: BorderSide(width: 3)),

      //               ),
      //                 child: Text(
      //                   'Cree les comptes clients',
      //                   style: TextStyle(
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 20,
      //                   ),
      //                 ),
      //             ),
      //           ),
      //           ////////////////////
                
      //           GestureDetector(
      //             onTap: (){
      //               //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
      //             },
      //             child: Container(
      //               width: double.infinity,
      //               margin: EdgeInsets.all(15.0),
      //               padding: EdgeInsets.all(10.0),
                    
      //               decoration: BoxDecoration(
      //                 // image: DecorationImage(
      //                 //   image: AssetImage('assets/images/22.png'),
      //                 //   fit: BoxFit.cover,
      //                 // ),
      //                 // border: Border.all(
      //                 //   width: 8,
      //                 // )

      //                 border: Border.all(color: Colors.grey,width: 3),
      //                 borderRadius: BorderRadius.all(Radius.circular(10))
      //                 //border: Border(bottom: BorderSide(width: 3)),
                      
      //               ),
      //                 child: Text(
      //                   'Gerer les lignes',
      //                   style: TextStyle(
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 20,
      //                   ),
      //                 ),
      //             ),
      //           ),

      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

}