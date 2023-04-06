import 'package:flutter/material.dart';



class Compte extends StatelessWidget {
  final Function addTaskCollback;
  @immutable
  Compte(this.addTaskCollback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(title: Text("Form Demo")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Nom',
                    //labelText: 'Name' 
                  ),
                  onChanged: (newText){
                     newTaskTitle = newText;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Prenom',
                    //labelText: 'Name' 
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    //labelText: 'Name' 
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    //labelText: 'Name' 
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    //labelText: 'Name' 
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Adresse',
                    //labelText: 'Name' 
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Nom',
                    //labelText: 'Name' 
                  ),
                ),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: () {addTaskCollback(newTaskTitle);}, child: Text('Add')),
              ]
            ),
          ),
        ),
      )
      
    );
  }
}