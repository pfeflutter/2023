import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:welapp/admin/admin_page.dart';
import 'package:welapp/agent/agent_page.dart';
import 'package:welapp/cllient/client_page.dart';
import 'package:welapp/welcome/welcome.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 380,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 101, 192, 233),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage()));
                          },
                        ),
                        ),
                        Column(
                          children: [
                          ClipOval(
                            child: Image(
                            //image: AssetImage('assets/images/logo11.png'),
                            image: AssetImage('assets/images/log112.png'),
                            width: 120, // specify desired width
                            height: 120, // specify desired height
                            fit: BoxFit.cover,
                          ),
                          // pour un bord plus épais
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // border: Border.all(
                          //  color: Colors.red,
                          //   width: 8,
                          // ),
                        ),
                            const Text(
                            'SmarTel',//+user.email!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'Inspiration',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 300),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Text(
                    //     'Login',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 43,
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'Inspiration'
                    //     ),
                    //   ),
                 
                    
              Padding(
                //padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // Text(
                      //   "Login",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //     fontSize: 40,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          //fillColor: Colors.white,
                          fillColor: Colors.white,
                          
                          hintText: 'Email',
                          enabled: true,
                          //contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value!.length == 0) {
                            return "Email ne peut pas être vide";
                          }
                          if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Veuillez entrer un email valide");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _isObscure3,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure3
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure3 = !_isObscure3;
                                });
                              }),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          enabled: true,
                          //contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.lock,),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password ne peut pas être vide";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("veuillez entrer un mot de passe valide. min 6 caractères");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                     
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                                elevation: 5.0,
                                height: 50,
                                minWidth: 400,
                                onPressed: () {
                                  setState(() {
                                    visible = true;
                                  });
                                  signIn(emailController.text, passwordController.text);
                                },
                        child: Text(
                          "Connexion",
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visible,
                          child: Container(
                              child: CircularProgressIndicator(
                            color: Colors.grey[400],
                          )
                          )
                        ),
                    ],
                  ),
                ),
              ),
            ],
                  ),
                ),
            ),
          ),
        ],
      ),  
     
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
            .collection('clients')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if(documentSnapshot.get('Nom') == "Adil") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  ClientPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  ClientPage(),
            ),
          );
        }

      } else {

        print('Document does not exist on the database');
      }});
      FirebaseFirestore.instance.collection('admin').doc(user.uid).get().then((DocumentSnapshot documentSnapshot){
        if (documentSnapshot.get('Nom') == "Admin") {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) =>  AdminPage(),
            ),
          );
        }
      });
      FirebaseFirestore.instance.collection('agents').doc(user.uid).get().then((DocumentSnapshot documentSnapshot){
        if (documentSnapshot.get('Nom') == "Agent") {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) =>  AgentPage(),
            ),
          );
        }
      });
    
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
