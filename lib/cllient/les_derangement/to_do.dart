class ToDo {
  String id;
  String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: 'Ma ligne n''est pas active',),
      ToDo(id: '02', todoText: 'Deconnexion d''internet', ),
      ToDo(id: '03', todoText: 'Internet est tree faible', ),
      ToDo(id: '04', todoText: 'Problemes de configuration', ),
      ToDo(id: '05', todoText: 'J''ai deja paie cette facture', ),
      ToDo(id: '06', todoText: 'Ma ligne n''pas active', ),
      
    ];
  }
}