import 'package:flutter/material.dart';
import 'package:welapp/espace/admin_page.dart';
import 'package:welapp/welcome/welcome.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {

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
            Icons.notifications_active,
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
                  'Espace Agents',
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminPage()));
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
                        'Reclamation des clients',
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
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
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
                        'Consulter les dérangements',
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
                        'Resoudre Les dérangements',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                  ),
                ),

                //////////////////////////////////////////////
                /*
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage()));
                  },
                  child: Container(
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
                */
              ],
            ),
          ),
        ),
      ),
    );
  }

}