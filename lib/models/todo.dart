class Todo {
  int? id;
  late String description;
  // bool isDone = false;

  Todo({this.id, required this.description});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['description'] = description;
    // map['isDone'] = isDone == false ? 0 : 1;
    return map;
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    description = map['description'];
    // isDone = map['isDone'] == 0 ? false : true;
  }
}
