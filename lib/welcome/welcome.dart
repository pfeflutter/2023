import 'package:flutter/material.dart';
import 'package:welapp/espace/espace_page.dart';
import 'package:welapp/login.dart';
import 'package:welapp/login/login_client.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome Page'),
      // ),
      //backgroundColor: Color.fromARGB(255, 226, 220, 220),

      // 
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            //height: double.infinity,
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 100,),
                ClipOval(
        child: Image(
                //image: AssetImage('assets/images/logo11.png'),
                image: AssetImage('assets/images/log112.png'),
                width: 150, // specify desired width
                height: 150, // specify desired height
                fit: BoxFit.cover,
              ),
        // pour un bord plus épais
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // border: Border.all(
        //   color: Colors.red,
        //   width: 8,
        // ),
      ),
                SizedBox(height: 20),
                const Text(
                  'SmarTel',
                  style: TextStyle(
                  
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    fontFamily: 'Inspiration',
                  ),
                ),
                SizedBox(height: 300,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  //primary: const Color.fromARGB(255, 121, 64, 195),
                   primary: Colors.blue,
                  textStyle: const TextStyle(fontSize: 25),
                  padding: const EdgeInsets.fromLTRB(80,10,80,10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      
                  },
      
                  child: const Text(
                    //'Get Started',
                    'Démarrer',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inspiration',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
      
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:welapp/espace/espace_page.dart';


// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: Column(
//         children: <Widget>[
//           ClipPath(
//             clipper: MyCliper(),
//             child: Container(
//                 height: 450,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 168, 195, 207),
//                 ),
//             ),
//           ),
          
//         ],
//       ),
      
//     );
//   }
// }

// class MyCliper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     var path = Path();
    
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }

// }