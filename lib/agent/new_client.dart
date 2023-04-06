import 'package:flutter/material.dart';

class NewCl extends StatefulWidget {
  const NewCl({super.key});

  @override
  State<NewCl> createState() => _NewClState();
}

class _NewClState extends State<NewCl> {
   
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  //SizedBox(height: 20,),
                  
              
                  
            
        
        //SizedBox(height: 500),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            //controller: ,
            decoration: InputDecoration(
              hintText: 'nom',
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 10),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            //controller: ,
            decoration: InputDecoration(
              hintText: 'nom',
              filled: true,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 25),
        //   child: TextField(
        //     keyboardType: TextInputType.number,
        //     //controller: ,
        //     decoration: InputDecoration(
        //       hintText: 'nom',
        //       filled: true,
        //     ),
        //   ),
        // ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
            child: const Text('fbfbf'),
            ),
            const SizedBox(width: 12,),
            ElevatedButton(
              onPressed: () {},
            child: const Text('update'),
            )
          ],
        ),
        
      
           ],    ),   ),
      ),
    ),
    );
  }  
}
