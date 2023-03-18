
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:welapp/auth.dart';
import 'package:welapp/cllient/client_page.dart';
import 'package:welapp/login/forget_passCl.dart';


class LoginClient extends StatefulWidget{
  const LoginClient({super.key});

  State<LoginClient> createState() => _LoginClientState();
}
class _LoginClientState extends State<LoginClient> {
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passToggle = true;
  final _formfield = GlobalKey<FormState>();

  //bool emailValid = 
  
  //Initia Firebase App
  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }

Future signIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim(),
  );
}
  
  

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Clients'),
        backgroundColor: Color.fromARGB(255, 222, 227, 230),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),  
      backgroundColor: Color.fromARGB(255, 222, 227, 230),
      body: SafeArea(
        //child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Client',
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 32, 32),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              SizedBox(height: 20,),
        
        
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        
                        prefixIcon: const Icon(Icons.email),
                      ),
                      // validate: (value){
                      //   if(value!.dispose){
                      //      return "Entrer Email";
                      //   }

                      // }
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 20,),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formfield,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock,),
                        /////////////////
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                              
                            });
                          },
                          child: Icon(
                            passToggle ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      // validator: (value){
                      //   if(value!.isEmpty){
                      //     return "Entrer Password";
                      //   }
                      //   else if(_passwordController.text.length < 6){
                      //     return "Pass Length shou...........";
                      //   }
                      // },
                    ),
                    
                    
                  ),
                ),
                ), 
              ),
              
              SizedBox(height: 10,),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                
                child: GestureDetector(
                  onTap: signIn,
                  
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.amber[900],
                      borderRadius: BorderRadius.circular(12),
                  //     suffixIcon: InkWell(
                  // onTap: () {
                  //   if(_formfield.currentState!.validate()){
                  //     print("succes");
                  //     _emailController.clear();
                  //     _passwordController.clear();
                  //   }
                  // },
                  //     ),
                    ),
                    
                        
                    child: Center(child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              //),
              ),
              SizedBox(height: 20,),

              //forget
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ClientPage()));
                },
                child: Text(
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