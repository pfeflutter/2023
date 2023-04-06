import 'package:flutter/material.dart';
import 'package:welapp/espace/espace_page.dart';


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
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
              image: AssetImage('assets/images/logo11.png'),
              //fit: BoxFit.cover
            ),
              // const Text(
              //   'Welcome',
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 2,
              //   ),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: const Color.fromARGB(255, 121, 64, 195),
                textStyle: const TextStyle(fontSize: 25),
                padding: const EdgeInsets.fromLTRB(100,20,100,20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const EspacePage()));

                },
                child: const Text(
                  'Get Started',
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