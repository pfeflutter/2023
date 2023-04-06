import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:welapp/login/forget_passCl.dart';


class LoginAgent extends StatefulWidget{
  const LoginAgent({super.key});

  @override
  State<LoginAgent> createState() => _LoginAgentState();
}
class _LoginAgentState extends State<LoginAgent> {
  
  final _eAcl = TextEditingController();
  final _pAcl = TextEditingController();
  
  
Future signIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
   //await FirebaseFirestore.instance.collection('admin').signIn(
    email: _eAcl.text.trim(),
    password: _pAcl.text.trim(),
  );
}


  @override
  void dispose() {
    super.dispose();
    _eAcl.dispose();
    _pAcl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Clients'),
        backgroundColor: const Color.fromARGB(255, 222, 227, 230),
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),  
      backgroundColor: const Color.fromARGB(255, 222, 227, 230),
      body: SafeArea(
        //child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login Agent',
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 32, 32),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height: 20,),
        
        
              //Email Textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _eAcl,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20,),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _pAcl,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock,),
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20,),
              //************sign in button*****************/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.amber[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                        
                    child: const Center(child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              //*******************forget***************/
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ForgetPassCl()));
                },
                child: const Text(
                  'Forget the Password ?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          
          ),
        //),
      ),
    );
  }
}






//   padding: const EdgeInsets.symmetric(
      //     horizontal: 20,
      //     //vertical: 70,
      //   ),
      //   width: MediaQuery.of(context).size.width,
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       children: <Widget>[
      //         const SizedBox(height: 200,),
      //         //Image.asset('assets/images/11.jpg'),

      //         //name
      //         TextField(
      //           // child: GestureDetector(
      //           //   onTap: singIn,
      //           controller: _nameController,
      //           decoration: InputDecoration(
      //             hintText: 'Username',
      //             prefixIcon: const Icon(Icons.account_box),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: const BorderSide(
      //                 color: Colors.orange,
      //                 width: 1.0,
      //               ),
      //             ),
      //             disabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: const BorderSide(
      //                 color: Colors.orange,
      //                 width: 1.0,
      //               ),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: const BorderSide(
      //                 color: Colors.orange,
      //                 width: 1.0,
      //               ),
      //             ),
      //           ),
      //           //),
      //         ),
      //         const SizedBox(height: 20,),

      //         //password
      
      //         TextField(
      //           //obscureText: isPasswordTextFeild ? isObscurePassword : false,
      //           controller: _passwordController,
      //           obscureText: true,
      //           decoration: InputDecoration(
      //             //suffixIcon: isPasswordTextFeild ?
      //             hintText: 'Password',
      //             prefixIcon: const Icon(
      //               //Icons.lock,
      //               Icons.lock,
      //             ),
                  
      //             // IconButton(
      //             //   icon: Icon(Icons.remove_red_eye, color: Colors.grey),
      //             //   onPressed: () {
      //             //     setState(() {
      //             //       isObscurePassword = !isObscurePassword;
      //             //     })
      //             //   },
      //             // ),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: const BorderSide(
      //                 color: Colors.orange,
      //                 width: 1.0,
      //               ),
      //             ),
      //             disabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: const BorderSide(
      //                 color: Colors.orange,
      //                 width: 1.0,
      //               ),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: const BorderSide(
      //                 color: Colors.orange,
      //                 width: 1.0,
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 20,),
      //         MaterialButton(
      //           elevation: 10,
      //           color: Colors.blueGrey,
      //           padding: const EdgeInsets.symmetric(
      //             vertical: 20,
      //             horizontal: 50,
      //           ),
      //           child: const Text('Login',
      //             style: TextStyle(
      //               color: Color.fromARGB(255, 84, 32, 32),
      //               fontSize: 23,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           shape: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(10),
      //             borderSide: BorderSide.none,
      //           ),
      //           onPressed: () {}
      //         ),
      //         const SizedBox(height: 20),
      //         GestureDetector(
      //           onTap: (){
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPassCl()));
      //           },
      //           child: Text(
      //             'Forget the Password ?',
      //             style: TextStyle(
      //               color: Colors.blue,
      //               fontSize: 20,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),









// import 'package:flutter/material.dart';
// import 'package:wel_page/login/forget_passCl.dart';

// class LoginAgent extends StatelessWidget {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Agent'),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 30,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           //vertical: 70,
//         ),
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 200,),
              
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Username',
//                   prefixIcon: const Icon(Icons.account_box),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.orange,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.orange,
//                       width: 1.0,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.orange,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   //suffixIcon: isPasswordTextFeild ?
//                   hintText: 'Password',
                  
//                   prefixIcon: const Icon(Icons.lock,),
                  
//                   // IconButton(
//                   //   icon: Icon(Icons.remove_red_eye, color: Colors.grey),
//                   //   onPressed: () {
//                   //     setState(() {
//                   //       isObscurePassword = !isObscurePassword;
//                   //     })
//                   //   },
//                   // ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.orange,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.orange,
//                       width: 1.0,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.orange,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               MaterialButton(
//                 elevation: 10,
//                 color: Colors.blueGrey,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 20,
//                   horizontal: 50,
//                 ),
//                 child: const Text('Login',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 84, 32, 32),
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 shape: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//                 onPressed: () {}
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPassCl()));
//                 },
//                 child: Text(
//                   'Forget the Password ?',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }