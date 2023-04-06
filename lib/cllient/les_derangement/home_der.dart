import 'package:flutter/material.dart';
import 'package:welapp/cllient/client_page.dart';
import 'package:welapp/cllient/les_derangement/to_do_item.dart';

import 'to_do.dart';


class Derangement extends StatefulWidget {
  //final String item;
 Derangement({Key? key, }) : super(key: key);

  @override
  State<Derangement> createState() => _DerangementState();
}

class _DerangementState extends State<Derangement> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.account_circle_rounded,color: Colors.grey,size: 35,),
          
        ],),
      ),
      body: Stack(
        children:[
         Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15),
            child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,borderRadius: BorderRadius.circular(20)
                ),
                child: TextField( 
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      minWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: ' Search',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                     Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        'Les Derangements',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                     ),
                     for( ToDo todo in _foundToDo.reversed )
                     ToDoItem(todo: todo,
                     onToDoChanged: _handleToDoChange,
                    // onDeleteItem: _deleteToDoItem,
                     ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(child: Container(
              margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )],
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'cree votre probleme',
                  border: InputBorder.none,
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.only(bottom: 20,right: 20),
              child: IconButton(
                color: Colors.blue,
                iconSize: 30,
                icon: Icon(Icons.send),
                onPressed: (){
                 // _addtodoItem(_todoController.text);
                },
              )
            )
          ],),
        )
        ],
      ),
    );
  }
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  // void _deleteToDoItem(String id){
  //   setState(() {
  //    todosList.removeWhere((item) => item.id == id);  
  //   });
  // }

  // void _addtodoItem(String toDo){
  //   setState(() {
  //     todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
  //    todoText: toDo)); 
  //   });
  //    _todoController.clear();
  // }

  void _runFilter(String entredKeyword){
    List<ToDo> results = [];
    if(entredKeyword.isEmpty){
      results = todosList;
    }
    else{
      results = todosList
      .where((item) => item.todoText
      .toLowerCase()
      .contains(entredKeyword.toLowerCase()))
      .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }
  
}