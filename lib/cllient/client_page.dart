import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:welapp/espace/agent_page.dart';
import 'package:welapp/welcome/welcome.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  //bool _isCheked = false;

  //creating static data in lists
  List catNames = [
    'Mon compte',
    'Classes',
    'Free Course',
    'BookStore',
    'Live Course',
    'LeaderBoard',
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),

    Color(0xFFCB84FB),
    Color(0xFF78E667),
    
  ];

  List<Icon> catIcons = [
    Icon(Icons.person, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];


@override
//Widget build(BuildContext context){
    //  return Scaffold(
    //   body: ListView(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
    //         decoration: BoxDecoration(
    //           color: Color(0xFF674AEF),
    //           borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(20),
    //             bottomRight: Radius.circular(0),
    //           )
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Icon(
    //                   Icons.dashboard,
    //                   size: 30,
    //                   color: Colors.white,
    //                 ),
    //                 Icon(
    //                   Icons.notifications,
    //                   size: 30,
    //                   color: Colors.white,
    //                 ),
    //               ],
    //             ), 
    //             SizedBox(height: 20,),
    //             Padding(
    //               padding: EdgeInsets.only(left: 3,bottom: 15),
    //               child: Text(
    //                 'Bienvenue Nom',
    //                 style: TextStyle(
    //                   fontSize: 25,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: 1,
    //                   wordSpacing: 2,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(top: 5, bottom: 20 ),
    //               width: MediaQuery.of(context).size.width,
    //               height: 55,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,

    //               ),
    //               // child: TextFromField(
                    
    //               // ),
    //             ),
    //           ],
    //         ),
    //       ),

    //       Padding(
    //         padding: EdgeInsets.only(top: 20, left: 15, right: 15),
    //         child: Column(
    //           children: [
    //             GridView.builder(
    //               itemCount: catNames.length,
    //               shrinkWrap: true,
    //               physics: NeverScrollableScrollPhysics(),
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 3,
    //                 childAspectRatio: 1.1,

    //               ),
    //               itemBuilder: (context, index){
    //                 return Column(
    //                   children: [
    //                     Container(
    //                       height: 60,
    //                       width: 60,
    //                       decoration: BoxDecoration(
    //                         color: catColors[index],
    //                         shape: BoxShape.circle,
    //                       ),
    //                       child: Center(
    //                         child: catIcons[index],
    //                       ),
    //                     ),
    //                     SizedBox(height: 10),
    //                     Text(
    //                       catNames[index],
    //                       style: TextStyle(
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.black.withOpacity(0.7),

    //                       ),
    //                     )
    //                   ],
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    //  );
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: const Text('client page'),
        backgroundColor: Colors.grey,
      
      //////////
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.person),iconSize: 30,),
        ///////////
        IconButton(
          onPressed: () {
            //ScaffoldMessenger.of(context).showSnackBar(
                //const SnackBar(content: Text('This is a snackbar')));
          },
          icon: const Icon(
            Icons.message,
          ),
          iconSize: 30,
          tooltip: 'Show Snackbar',
        ),
        
      ],
      //////////
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ///////////////
      
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(
         // padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
          // decoration: BoxDecoration(
          //      color: Color(0xFF674AEF),
          //      borderRadius: BorderRadius.only(
          //        bottomLeft: Radius.circular(20),
          //        bottomRight: Radius.circular(0),
          //      )
          //    ),
          //horizontal: 0,
          
        ),
        child: SingleChildScrollView(
          
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(height: 40,),
                Text(
                  'Bienvenue',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                ///////////////////
                SizedBox(height: 30,),
                ////////////////////
                GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
                  },
                  
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      //border: Border(bottom: BorderSide(width: 3)),

                    ),
                      child: Text(
                        'Mon Compte',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                ),
                ////////////////////
                
                GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AgentPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/22.png'),
                      //   fit: BoxFit.cover,
                      // ),
                      // border: Border.all(
                      //   width: 8,
                      // )

                      border: Border.all(color: Colors.grey,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      //border: Border(bottom: BorderSide(width: 3)),
                      
                    ),
                      child: Text(
                        'Mes Factures',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                ),
                //SizedBox(height: 40),
                //////////////////////////////////////
                
                GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      
                     // border: Border(bottom: BorderSide(width: 3)),

                    ),
                      child: Text(
                        'Les dérangements',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                ),

                //////////////////////////////////////////////
                
                GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage()));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      //border: Border(bottom: BorderSide(width: 3)),

                    ),
                      child: Text(
                        'Mes Lignes',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                ),
                MaterialButton(onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'sign out',
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}