import 'package:flutter/material.dart';

import 'c_client.dart';


class TasksListe extends StatefulWidget {
  final List<Task> tasks;
  const TasksListe(this.tasks); 

  @override
  State<TasksListe> createState() => _TasksListeState();
}

class _TasksListeState extends State<TasksListe> {
  
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context,index){
      // return Dismissible(
      //   key: tasks[index],
      //   child: Card(
      //                     elevation: 4,
      //           margin: const EdgeInsets.all(8),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(8),
      //   ),
      //   child: ListTile(
      //     title: widget.tasks[index],
      //     trailing: IconButton(
      //               icon: const Icon(
      //                 Icons.delete,
      //               ),
      //               onPressed: () {
      //                 setState(() {
      //                   widget.tasks.removeAt(index);
      //                 });
      //               },
      //             ),
      //   ),
      //   ),
      // );
      return TaskTitle(taskTitle: widget.tasks[index].name);
      
      
      // ignore: dead_code
      // child: Card(
      //   elevation: 4,
      //   margin: EdgeInsets.all(8),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(8),
        
      //   ),
      // );
    },
    
    // child: Card(
    //   elevation: 4,
    //   margin: const EdgeInsets.all(8),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8),

    //   ),
    //   child: ListTile(
    //     title: Text(todos[index]),
    //     trailing: IconButton(
    //       icon: const Icon(
    //         Icons.delete,
    //       ),
    //       onPressed: () {
    //         setState(() {
    //           todos.removeAt(index);
    //         });
    //       },
    //     ),
    //   ),
    // ),
    );
    // return ListView(
    //   children: [
    //      TaskTitle(
    //       taskTitle: tasks[0].name,
    //      ),
    //      TaskTitle(
    //       taskTitle: tasks[1].name,
    //      ),
    //     // TaskTitle(),
    //     // TaskTitle(),
    //   ],
    // );
  }
}