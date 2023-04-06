import 'package:flutter/material.dart';
import 'package:welapp/cllient/les_derangement/to_do.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          //print('checked on this icon');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
         todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
          ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
           // decoration: todo.isDone? TextDecoration.lineThrough : null,
            ),
            ),
            trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 35,
              width: 35,
              
              // child: IconButton(
              //   color: Colors.black,
              //   iconSize: 18,
              //   icon: Icon(Icons.delete/arrow_forward_ios/),
              //   onPressed: (){
              //     //print('Clicked on delet icon');
              //     onDeleteItem(todo.id);
              //   },
              //)
            ),
      ),
            );
  }
}