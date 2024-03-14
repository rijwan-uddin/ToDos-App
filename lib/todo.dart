import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Tasks'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: MyTodo.todos.length,
        itemBuilder: (context, index) {
          final todo = MyTodo.todos[index];
        },
      ),
    );
  }
}

class todoitem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;

  const todoitem({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: todo.completed,
        onChanged: (value){
          
         }
        );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  todoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}

enum todoPriority { Low, Normal, High }
